#!/usr/bin/env bash
# Switch installed Fancy skill bodies between English (default) and zh-CN.
# Mutates copies under the current project's .claude/skills, .agents/skills,
# and .cursor/skills. Does not change the fancy-skills git sources.
set -euo pipefail

LOCALE="${1:-}"
if [[ "$LOCALE" != "en" && "$LOCALE" != "zh-CN" ]]; then
  echo "usage: set-locale.sh en|zh-CN" >&2
  echo "default install language is English. zh-CN overwrites SKILL.md from SKILL.zh-CN.md." >&2
  exit 1
fi

ROOT="${FANCY_LOCALE_ROOT:-$PWD}"
bases=(
  "$ROOT/.claude/skills"
  "$ROOT/.agents/skills"
  "$ROOT/.cursor/skills"
)

apply_dir() {
  local dir="$1"
  local changed=0
  local zh
  for zh in "$dir"/*.zh-CN.md; do
    [[ -e "$zh" ]] || continue
    local stem dest en_backup
    stem="$(basename "$zh" .zh-CN.md)"
    dest="$dir/${stem}.md"
    en_backup="$dir/${stem}.en.md"
    [[ -f "$dest" ]] || continue
    if [[ "$LOCALE" == "zh-CN" ]]; then
      if [[ ! -f "$en_backup" ]]; then
        cp "$dest" "$en_backup"
      fi
      cp "$zh" "$dest"
      changed=1
    else
      if [[ -f "$en_backup" ]]; then
        cp "$en_backup" "$dest"
        changed=1
      fi
    fi
  done
  if [[ "$changed" -eq 1 ]]; then
    printf '%s\n' "$LOCALE" >"$dir/.fancy-locale"
    echo "locale $LOCALE -> $dir"
  fi
}

found=0
for base in "${bases[@]}"; do
  [[ -d "$base" ]] || continue
  for d in "$base"/fancy-*; do
    [[ -d "$d" && -f "$d/SKILL.md" ]] || continue
    found=1
    apply_dir "$d"
  done
done

if [[ "$found" -eq 0 ]]; then
  echo "set-locale: no installed fancy-* skills under $ROOT/.claude/skills, .agents/skills, or .cursor/skills" >&2
  echo "run this from the project where you ran npx skills add." >&2
  exit 1
fi
