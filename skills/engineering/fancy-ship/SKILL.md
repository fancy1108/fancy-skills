---
name: fancy-ship
description: >-
  Release the product and update memory: production config, rollback point,
  PROGRESS.md. Use when fancy-flow has hardened the build, or the user asks to
  deploy or close an iteration. Do not ship on mock data. Do not use at
  proposal time.
---

# Fancy Ship

Close the loop. Production, not a demo. Then write down what the next session needs.

## Gate in

`/fancy-harden` should have left evidence. If the happy path was never run, go back. Do not ship a UI that still runs on mocks.

## Release

- Production env (not local placeholders)
- Migrations verified somewhere that is not only the laptop
- Strip secrets from logs
- Error monitoring if the product is public
- Record a rollback commit hash
- Mark deploy in `memory/PROGRESS.md` (create it if Mini/Pro layout exists)

## Iterate

- What failed in the real world → `memory/FAILURES.md`
- Durable architecture calls → `decisions.md`; temporary calls → `memory/DECISIONS.md`
- Next iteration from usage, not from leftover idea lists

## Done when

There is a shipped URL or an explicit local-only ship note, rollback hash is recorded, memory files the repo uses are updated. Tell `/fancy-flow` the pipeline is idle.
