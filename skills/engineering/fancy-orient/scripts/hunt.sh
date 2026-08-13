#!/usr/bin/env bash
# Wrapper so the agent can run this skill's hunt without remembering python3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
exec python3 "$ROOT/hunt.py" "$@"
