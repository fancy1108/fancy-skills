#!/usr/bin/env bash
# Rebuild the generated inventory in skills/engineering/catalog/SKILL.md
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
ASK = ROOT / "skills" / "engineering" / "catalog" / "SKILL.md"
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
    for raw in m.group(1).splitlines():
        line = raw.strip()
        if not line or line.startswith("#") or ":" not in line:
            continue
        key, val = line.split(":", 1)
        val = val.strip().strip("'").strip('"')
        data[key.strip()] = val
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
        bucket = bucket_of(path)
        check_readme(path, name, bucket)
        row = (name, desc)
        if fm.get("disable-model-invocation") == "true":
            user.append(row)
        else:
            model.append(row)
    return user, model


def render(user: list[tuple[str, str]], model: list[tuple[str, str]]) -> str:
    lines = [
        "## Available skills",
        "",
        "This list is generated from `.claude-plugin/plugin.json`. Do not edit it by hand.",
        "",
        "**User-invoked**",
        "",
    ]
    if user:
        for name, desc in user:
            lines.append(f"- **`/{name}`** — {desc}")
    else:
        lines.append("None.")
    lines += ["", "**Model-invoked**", ""]
    if model:
        for name, desc in model:
            lines.append(f"- **`/{name}`** — {desc}")
    else:
        lines.append("None.")
    lines.append("")
    return "\n".join(lines)


def split_ask(text: str) -> tuple[str, str, str]:
    if BEGIN not in text or END not in text:
        die(f"{ASK} is missing {BEGIN} / {END} markers")
    before, rest = text.split(BEGIN, 1)
    mid, after = rest.split(END, 1)
    return before, mid, after


def assembled(before: str, body: str, after: str) -> str:
    return f"{before}{BEGIN}\n{body}{END}{after}"


def main() -> None:
    check = "--check" in sys.argv[1:]
    user, model = collect()
    body = render(user, model)
    original = ASK.read_text(encoding="utf-8")
    before, current, after = split_ask(original)
    new = assembled(before, body, after)
    if check:
        if new != original:
            die("generated inventory is stale; run scripts/build-router.sh", 1)
        print("build-router: ok")
        return
    if new != original:
        ASK.write_text(new, encoding="utf-8")
        print(f"build-router: wrote {ASK.relative_to(ROOT)}")
    else:
        print("build-router: already up to date")


if __name__ == "__main__":
    main()
PY
