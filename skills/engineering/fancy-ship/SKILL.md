---
name: fancy-ship
description: >-
  Release the product and update memory: production config, rollback point,
  PROGRESS.md, and which step the next iteration starts at. Use when fancy-flow
  has hardened the build, or the user asks to deploy or close an iteration. Do
  not ship on mock data. Do not use at proposal time.
---

# Fancy Ship

Close the loop. Production, not a demo. Then write down what the next session needs.

## Gate in

`/fancy-harden` should have left evidence. If the happy path was never run, go back. Do not ship a UI that still runs on mocks.

A toy or local-only tool may ship as **local-only**. Write that down explicitly (how to run it, that there is no URL). Still update memory.

## Release

- [ ] Production env (not local placeholders) — or an explicit local-only note
- [ ] Migrations verified somewhere that is not only the laptop (skip if no DB)
- [ ] Strip secrets from logs
- [ ] Error monitoring if the product is public
- [ ] Record a rollback commit hash (`git rev-parse HEAD`)
- [ ] Mark deploy in `memory/PROGRESS.md` (create it if Mini/Pro layout exists)

## Iterate (ten minutes)

Update only files that exist; do not invent a six-pack on a Micro repo.

1. `memory/PROGRESS.md` — where we stopped
2. `memory/FAILURES.md` — what failed in the real world
3. Durable architecture calls → `specs/.../decisions.md`; temporary calls → `memory/DECISIONS.md`
4. Next iteration from usage, not from leftover idea lists
5. Keep `CLAUDE.md` as routing + iron rules only

**Name the next start** (write it in PROGRESS):

| Change | Next stage |
| --- | --- |
| Interaction is wrong | `/fancy-shape` (visual / prototype) |
| Small fix / bug | `/fancy-build` |
| Architecture | `/fancy-shape` split (`decisions.md` / `tasks.md`) |
| Direction is wrong | `/fancy-orient` |

## Done when

There is a shipped URL or an explicit local-only ship note, rollback hash is recorded, memory files the repo uses are updated, and the next stage is named. Tell `/fancy-flow` the pipeline is idle.
