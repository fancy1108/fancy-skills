#!/usr/bin/env bash
# Wrapper for a clone of this repo. Consumers who used npx should run
# .claude/skills/fancy-locale/scripts/set-locale.sh instead.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
exec bash "$ROOT/skills/engineering/fancy-locale/scripts/set-locale.sh" "$@"
