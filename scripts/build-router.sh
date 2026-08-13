#!/usr/bin/env bash
# Rebuild the generated inventory in skills/engineering/fancy-discover/SKILL.md
# from .claude-plugin/plugin.json (source of truth) + each skill's frontmatter.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export FANCY_SKILLS_ROOT="$ROOT"

python3 - "$@" <<'PY'
from __future__ import annotations

import json
import os
import re
import sys
from pathlib import Path

ROOT = Path(os.environ["FANCY_SKILLS_ROOT"])
PLUGIN = ROOT / ".claude-plugin" / "plugin.json"
ASK = ROOT / "skills" / "engineering" / "fancy-discover" / "SKILL.md"
ASK_ZH = ROOT / "skills" / "engineering" / "fancy-discover" / "SKILL.zh-CN.md"
BEGIN = "<!-- BEGIN GENERATED INVENTORY -->"
END = "<!-- END GENERATED INVENTORY -->"
PROMOTED = ("engineering", "productivity")
FM_RE = re.compile(r"\A---\s*\n(.*?)\n---\s*", re.S)


def die(msg: str, code: int = 1) -> None:
    print(f"build-router: {msg}", file=sys.stderr)
    raise SystemExit(code)


def parse_frontmatter(text: str) -> dict[str, str]:
    m = FM_RE.match(text)
    if not m:
        die("SKILL.md is missing YAML frontmatter")
    data: dict[str, str] = {}
    key: str | None = None
    folded: list[str] = []
    folding = False

    def flush() -> None:
        nonlocal key, folded, folding
        if key is None:
            return
        if folding:
            data[key] = " ".join(folded).strip()
        folding = False
        folded = []
        key = None

    for raw in m.group(1).splitlines():
        if folding:
            if raw.startswith(" ") or raw.startswith("\t"):
                folded.append(raw.strip())
                continue
            flush()
        line = raw.strip()
        if not line or line.startswith("#") or ":" not in line:
            continue
        k, val = line.split(":", 1)
        k, val = k.strip(), val.strip()
        if val in (">", ">-", "|", "|-"):
            key = k
            folding = True
            folded = []
            continue
        flush()
        data[k] = val.strip("'").strip('"')
        key = None
    flush()
    return data


def load_plugin_skills() -> list[Path]:
    try:
        plugin = json.loads(PLUGIN.read_text(encoding="utf-8"))
    except FileNotFoundError:
        die(f"missing {PLUGIN}")
    except json.JSONDecodeError as e:
        die(f"invalid plugin.json: {e}")
    skills = plugin.get("skills")
    if not isinstance(skills, list) or not skills:
        die("plugin.json has no skills array")
    paths: list[Path] = []
    for entry in skills:
        if not isinstance(entry, str):
            die(f"skill path must be a string: {entry!r}")
        path = (ROOT / entry).resolve()
        try:
            path.relative_to(ROOT.resolve())
        except ValueError:
            die(f"skill path escapes repo: {entry}")
        skill_md = path / "SKILL.md"
        if not skill_md.is_file():
            die(f"no SKILL.md at {entry}")
        paths.append(path)
    return paths


def bucket_of(path: Path) -> str:
    rel = path.relative_to(ROOT / "skills")
    parts = rel.parts
    if len(parts) < 2:
        die(f"skill is not under skills/<bucket>/: {path}")
    return parts[0]


def check_readme(path: Path, name: str, bucket: str) -> None:
    if bucket not in PROMOTED:
        die(f"plugin.json lists non-promoted skill {name} in {bucket}/")
    readme = ROOT / "skills" / bucket / "README.md"
    if not readme.is_file():
        die(f"missing {readme}")
    needle = f"](./{name}/SKILL.md)"
    if needle not in readme.read_text(encoding="utf-8"):
        die(f"{readme} has no link {needle}")


def collect() -> tuple[list[tuple[str, str]], list[tuple[str, str]]]:
    user: list[tuple[str, str]] = []
    model: list[tuple[str, str]] = []
    for path in load_plugin_skills():
        text = (path / "SKILL.md").read_text(encoding="utf-8")
        fm = parse_frontmatter(text)
        name = fm.get("name") or path.name
        desc = fm.get("description")
        if not desc:
            die(f"{path}/SKILL.md is missing description")
        zh = path / "SKILL.zh-CN.md"
        if not zh.is_file():
            die(f"missing {zh.relative_to(ROOT)} (promoted skills need a Chinese body)")
        bucket = bucket_of(path)
        check_readme(path, name, bucket)
        row = (name, desc)
        if fm.get("disable-model-invocation") == "true":
            user.append(row)
        else:
            model.append(row)
    return user, model


def collect_zh() -> tuple[list[tuple[str, str]], list[tuple[str, str]]]:
    user: list[tuple[str, str]] = []
    model: list[tuple[str, str]] = []
    for path in load_plugin_skills():
        zh_path = path / "SKILL.zh-CN.md"
        text = zh_path.read_text(encoding="utf-8")
        fm = parse_frontmatter(text)
        name = fm.get("name") or path.name
        desc = fm.get("description")
        if not desc:
            die(f"{zh_path} is missing description")
        row = (name, desc)
        if fm.get("disable-model-invocation") == "true":
            user.append(row)
        else:
            model.append(row)
    return user, model


def render(
    user: list[tuple[str, str]],
    model: list[tuple[str, str]],
    *,
    heading_note: str,
    user_h: str,
    model_h: str,
) -> str:
    lines = [
        "## Available skills" if heading_note.startswith("This list") else "## 已收录技能",
        "",
        heading_note,
        "",
        f"**{user_h}**",
        "",
    ]
    if user:
        for name, desc in user:
            lines.append(f"- **`/{name}`** — {desc}")
    else:
        lines.append("None." if heading_note.startswith("This list") else "暂无。")
    lines += ["", f"**{model_h}**", ""]
    if model:
        for name, desc in model:
            lines.append(f"- **`/{name}`** — {desc}")
    else:
        lines.append("None." if heading_note.startswith("This list") else "暂无。")
    lines.append("")
    return "\n".join(lines)


def split_file(path: Path, text: str) -> tuple[str, str, str]:
    if BEGIN not in text or END not in text:
        die(f"{path} is missing {BEGIN} / {END} markers")
    before, rest = text.split(BEGIN, 1)
    _, after = rest.split(END, 1)
    return before, "", after


def assembled(before: str, body: str, after: str) -> str:
    return f"{before}{BEGIN}\n{body}{END}{after}"


def rewrite(path: Path, body: str, check: bool) -> bool:
    original = path.read_text(encoding="utf-8")
    before, _, after = split_file(path, original)
    new = assembled(before, body, after)
    if check:
        return new != original
    if new != original:
        path.write_text(new, encoding="utf-8")
        print(f"build-router: wrote {path.relative_to(ROOT)}")
        return True
    print(f"build-router: already up to date ({path.name})")
    return False


def main() -> None:
    check = "--check" in sys.argv[1:]
    user, model = collect()
    user_zh, model_zh = collect_zh()
    body = render(
        user,
        model,
        heading_note="This list is generated from `.claude-plugin/plugin.json`. Do not edit it by hand.",
        user_h="User-invoked",
        model_h="Model-invoked",
    )
    body_zh = render(
        user_zh,
        model_zh,
        heading_note="本列表由 `.claude-plugin/plugin.json` 生成。不要手改。",
        user_h="用户触发",
        model_h="模型触发",
    )
    stale_en = rewrite(ASK, body, check)
    stale_zh = rewrite(ASK_ZH, body_zh, check)
    if check:
        if stale_en or stale_zh:
            die("generated inventory is stale; run scripts/build-router.sh", 1)
        print("build-router: ok")
        return


if __name__ == "__main__":
    main()
PY
