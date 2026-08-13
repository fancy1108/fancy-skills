# Shape init (step 3)

First irreversible act. Empty shell only — no schema, no business code, no filled `tasks.md`.

## Three layers — all green before `git init`

1. Orient handshake: three questions stable, `proposal.md` on disk (Pitch, MVP, Non-Goals).
2. Proposal still complete: one-sentence Pitch, one MVP, explicit Non-Goals. If any is mush, return to `/fancy-orient`.
3. Tech ready, **user confirms** (do not invent):
   - stack in one sentence
   - likely start command
   - which agent they will use in this repo

Missing any layer → stay here.

## Tiers — ask, then build

Show this table (or A / B / C) **in the chat** before `git init`. Then you may mark one as recommended. Wait for a pick. Default Mini only if they shrug **after seeing the three**.

Forbidden: "This is a personal tool, I suggest Mini, confirm?" — they never learn Micro or Pro exist.

| Tier | When | What to create |
| --- | --- | --- |
| **Micro** | One-shot script, no UI, no cross-session memory | `git init` + short `CLAUDE.md` (or Cursor rule) ≤ 60 lines |
| **Mini** (default if they shrug) | Personal product, 2–3 capabilities | Layers 1–3: `CLAUDE.md`, `specs/core/proposal.md`, `memory/PROGRESS.md`, `.gitignore`, `.env.example` |
| **Pro** | Long-lived product, many sessions | Mini + `memory/{PROGRESS,FAILURES,ARCHITECTURE,DECISIONS,ROADMAP,TESTS}.md` (empty stubs), empty `.claude/` / `.cursor/` / `runs/`, `docs/document-governance.md` if they want it |

Stack, start command, and persistence follow the same rule: labeled options first, recommendation second. Do not lock a stack with a yes/no on a single pick.

## Move the proposal

- Single product (default): `proposal.md` → `specs/core/proposal.md`
- Named feature: `specs/<feature>/proposal.md`

Do not paste the whole proposal into `CLAUDE.md`.

| From proposal | Into `CLAUDE.md`? |
| --- | --- |
| Pitch (one line) | Yes |
| Vibe constraints, as executable bans | Yes (3–7 imperative sentences) |
| Start command + verify command | Yes |
| Check-in: new session reads `memory/PROGRESS.md` (if Mini+) then `git log --oneline -5` | Yes |
| Goals, Non-Goals, Visual Mood, Assumptions, Risks | No — stay in `specs/` |

`CLAUDE.md` must not contain feature lists, DB schema, API routes, or `design.md` / `tasks.md` body.

## After the files exist

First commit of the empty shell. Then ask the agent-facing check: recap Pitch + iron rules + start command in three lines. If that recap is wrong, fix `CLAUDE.md` before leaving init.

## Authority if files disagree

`specs/` > `CLAUDE.md` > `memory/` > `runs/`
