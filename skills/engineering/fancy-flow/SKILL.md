---
name: fancy-flow
description: >-
  Start or continue a product / vibe-coding pipeline. Use when the user wants
  to start a new product, execute a vibe coding workflow, or explicitly says
  continue in a project workspace. Do not use for one-shot questions, regex
  help, or a small bugfix.
---

# Fancy Flow

Intent-triggered assembler. Detect the stage, run the next **shipped** skill, stop at gates. If you were reached for a one-shot question, **decline the pipeline** and answer it.

## Do not steal ordinary chat

Leave if the user wants a regex, a traceback, a one-file fix, or anything that is not "new product / vibe coding / continue this product". Say nothing about `proposal.md`.

## Stages

| Stage | Human steps | Gate (must exist before leaving) |
| --- | --- | --- |
| `/fancy-orient` | 1 find the problem, 2 write the proposal | `proposal.md` + **three questions** stable. No git repo |
| `/fancy-shape` | 3 init, 4 visual, 5 or 5.5 contract, 6 split tasks | `design.md` + **high-fidelity prototype** + `tasks.md` + `decisions.md` |
| `/fancy-build` | 7 write code | Tasks delivered as real code, one at a time |
| `/fancy-harden` | 8 test, 8.5 drift alignment | Physical verification logs + fixes. Evidence, not claims |
| `/fancy-ship` | 9 release | Live (or shipped) status + memory updated |

**Three questions** (user answers, agent does not invent): Who is this for? How painful is it? Why now?

**High-fidelity prototype** is a **shape** deliverable, not optional flavour. It is the interactive contract the later stages must not violate. See `/fancy-shape` for the three branches (from-scratch demo, existing prototype, no UI).

## Detect and dispatch

Look at the workspace. Run **one** next stage. Stay in-session until that stage reports done or the user stops.

| What you see | Do |
| --- | --- |
| No proposal, or three questions shaky | `/fancy-orient` |
| Handshake done, shape gate incomplete | `/fancy-shape` |
| Shape gate complete, tasks still open | `/fancy-build` |
| Tasks done, no physical verification / drift still open | `/fancy-harden` |
| Hardened, not shipped | `/fancy-ship` |
| User wants to skip to code | Refuse until the **shape gate** is complete (and orient before that) |

Never invoke user-invoked skills (`/fancy-discover`, `/fancy-init`). Shape does its own repo init.

## Hard gates

- **No `git init`** until orient's three questions are stable. Orient must not init. Flow must not init. Shape inits.
- **No business code** until the shape gate is complete, including the high-fidelity prototype (or an explicit no-UI waiver in `decisions.md`).
- Do not invent `/grill-me` or Superpowers. Missing stages are named, not faked.
