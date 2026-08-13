# Shape init (step 3)

First irreversible act. Orient gate must already be green. Default to **Mini** unless the user picks otherwise.

## Tiers

| Tier | When | What to create |
| --- | --- | --- |
| **Micro** | One-shot script, no UI, no cross-session memory | `git init` + short `CLAUDE.md` (or Cursor rule) ≤ 60 lines. No `specs/` required if proposal already lives next to the script — still do not write business code here |
| **Mini** (default) | Personal product, 2–3 capabilities, a UI toy | Layers 1–3: `CLAUDE.md`, `specs/core/proposal.md`, `memory/PROGRESS.md`, `.gitignore`, `.env.example` |
| **Pro** | Long-lived SaaS, many sessions | Mini + empty `memory/` six-pack (`PROGRESS`, `FAILURES`, `DECISIONS`, `ARCHITECTURE`, `ROADMAP`, plus one more the repo already uses), empty `.claude/` / `.cursor/` / `runs/` dirs, `docs/document-governance.md` if they want it |

Decision tree: many sessions / multiplayer / SaaS → Pro. Need specs + memory → Mini. Script only → Micro. Unsure → Mini.

## Move the proposal

- Single product (default): `proposal.md` → `specs/core/proposal.md`
- Named feature: `specs/<feature>/proposal.md`

Do not paste the whole proposal into `CLAUDE.md`.

| From proposal | Into `CLAUDE.md`? |
| --- | --- |
| Pitch (one line) | Yes |
| Vibe constraints, as executable bans | Yes (3–7 imperative sentences) |
| Start command + verify command | Yes |
| Check-in: new session reads `memory/PROGRESS.md` (if Mini+) and `git log --oneline -5` | Yes |
| Goals, Non-Goals, Visual Mood, Assumptions, Risks | No — stay in `specs/` |

## `CLAUDE.md` must not contain

Feature lists, DB schema, API routes, `design.md` / `tasks.md` body, competitor analysis.

## Stack gate (still before any product code)

The user (not the model) confirms in one sentence: language / framework, and the likely start command (`pnpm dev`, `python main.py`, …). If they cannot, stay in init; do not invent a stack.

## Authority if files disagree

`specs/` > `CLAUDE.md` > `memory/` > `runs/`
