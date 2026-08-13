---
name: fancy-flow
description: >-
  Start or continue a product / vibe-coding pipeline. Use when the user wants
  to start a new product, make an app or tool, execute a vibe coding workflow,
  or explicitly says continue in a project workspace. Do not use for a regex,
  a traceback, or a one-file bugfix in an existing product.
---

# Fancy Flow

Intent-triggered assembler. Detect the stage, run the next **shipped** skill, stop at gates. If you were reached for a regex, a traceback, or a one-file fix, **decline the pipeline** and answer it.

A request to **make something** (an app, a tool, a product) is a product start. That is this skill. It is not a regex.

## Do not steal ordinary chat

Leave if the user wants a regex, a traceback, a one-file fix, or anything that is not "new product / vibe coding / continue this product". Say nothing about `proposal.md`.

## Stages

| Stage | Human steps | Gate (must exist before leaving) |
| --- | --- | --- |
| `/fancy-orient` | 1 research pain, 2 write the proposal | `proposal.md` **accepted** + three questions stable. Research before the questions. No git repo |
| `/fancy-shape` | 3 init, 4 visual, 5 or 5.5 contract, 6 split tasks | `design.md` + **accepted** prototype + **accepted** `tasks.md` + `decisions.md` |
| `/fancy-build` | 7 write code | Tasks delivered as real code, one at a time |
| `/fancy-harden` | 8 test, 8.5 drift alignment | Physical verification logs + fixes. Evidence, not claims |
| `/fancy-ship` | 9 release | Live (or shipped) status + memory updated |

**Three questions** (user answers, agent does not invent): Who is this for? How painful is it? Why now?

**High-fidelity prototype** is a **shape** deliverable, not optional flavour. It is the interactive contract the later stages must not violate. See `/fancy-shape` for the three branches (from-scratch demo, existing prototype, no UI).

## Detect and dispatch

Look at the workspace. Run **one** next stage. When that stage hits a **human lock**, stop the turn and wait. Do not start the next stage in the same message.

A file on disk is a **draft**. It is not acceptance.

| What you see | Do |
| --- | --- |
| No proposal, or the written proposal has not been accepted | `/fancy-orient` (even if they already named a product or dropped a UI folder) |
| Proposal accepted, shape gate incomplete | `/fancy-shape` — only after they accepted the proposal (or said continue on an already-accepted one) |
| Shape gate complete **and** they accepted tasks.md, tasks still open | `/fancy-build` |
| Tasks done, they said continue, no physical verification / drift still open | `/fancy-harden` |
| Hardened, they used it, not shipped | `/fancy-ship` — after they say yes to the ship plan |
| User wants to skip to code | Refuse until the **shape gate** is complete (and orient before that) |
| Small bugfix / one-file fix and they did **not** ask to continue the product | Decline the pipeline. Do not start orient |

## Human locks (do not skip)

Stop. Ask one question. Wait for the reply. Then either edit or proceed.

| Draft | Ask | Until they |
| --- | --- | --- |
| Research table | Which pain is yours? What did I get wrong? | react |
| `proposal.md` | Is Pitch / MVP / Non-Goals right? | accept or name edits |
| Init menus | which tier / stack / persistence | pick |
| Three visual directions | which (or mix) | pick |
| Prototype / demo | Open it. What should change? | accept, or a change list — then revise and ask again |
| `tasks.md` | Is this split right? | accept |
| Harden evidence | Use it once. What's wrong? | they used it |
| Ship plan | Deploy / local-only — yes? | yes |

Forbidden: write `proposal.md` then immediately run `/fancy-shape`. Forbidden: write `demo.html` then immediately write `contract.ts`. Forbidden: declare shape complete and start `/fancy-build` in the same turn.

Never invoke user-invoked skills (`/fancy-discover`, `/fancy-init`, `/fancy-locale`). Shape does its own repo init.

If this conversation already named a product, pass that sentence into `/fancy-orient` as the seed. Do not make orient ask what they want.

## Hard gates

- **No `git init`** until orient's three questions are stable **and** the proposal is accepted. Orient must not init. Flow must not init. Shape inits.
- **No business code** until the shape gate is complete, including the high-fidelity prototype (or an explicit no-UI waiver in `decisions.md`) **accepted by the user**.
