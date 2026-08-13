---
name: fancy-flow
description: >-
  Start or continue a product / vibe-coding pipeline. Use when the user wants
  to start a new product, execute a vibe coding workflow, or explicitly says
  continue in a project workspace. Do not use for one-shot questions, regex
  help, or a small bugfix.
---

# Fancy Flow

Intent-triggered pipeline. You are the assembler: detect where the work is, run the next shipped stage, stop at gates. You are not always-on — if this skill was reached for a one-shot question, **decline the pipeline** and answer the question.

## Do not steal ordinary chat

Leave this skill if the user is asking for a regex, a traceback, a one-file fix, or anything that is not "new product / vibe coding / continue this product". Say nothing about `proposal.md`.

## Detect state

Look, don't guess:

| Signal | Meaning |
| --- | --- |
| No `proposal.md` and no `specs/**/proposal.md` | Orient has not finished |
| Proposal exists but the **three questions** are missing or shaky | Orient is incomplete |
| Proposal exists, three questions are stable, **no git repo** | Handshake done. Do **not** `git init`. Later stages are not shipped yet |
| `.git` plus `design.md` / `tasks.md` / `decisions.md` | Later stages (shape / build). Not shipped yet |

**Three questions** (must be answered by the user, not invented):

1. Who is this for?
2. How painful is it?
3. Why now?

## Dispatch

1. **Orient incomplete** → run the `/fancy-orient` skill. Stay in this session until it reports the handshake is done or the user stops.
2. **Handshake done, no later stage shipped** → tell the user: three questions are locked, `proposal.md` is written, **do not create a repo yet**. Next flesh on this skeleton is shape (init + design + tasks). Stop.
3. **User asked to skip to code** → refuse until the three questions are stable. No repo, no business code.

A stage skill is model-invoked on purpose so this skill can reach it. Never try to invoke a user-invoked skill (`/fancy-discover`, `/fancy-init`).

## Hard gates

- **No git repo** until the three questions are stable. `fancy-orient` must not `git init`. Neither must you.
- **No business code** until later stages exist *and* `design.md` + `tasks.md` + `decisions.md` are present. Today those stages are not shipped — do not improvise them.
- **No DB schema, no task list, no UI spec** during orient.

## When a stage is missing

Name it. Do not fake `/grill-me`, `/tdd`, or Superpowers. Point at `/fancy-discover` only if the user asks what else is in the collection (they type that themselves).
