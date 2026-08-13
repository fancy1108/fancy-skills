---
name: fancy-shape
description: >-
  Prepare to write code: init the repo, lock visual contract, produce a
  high-fidelity prototype, then decisions.md and tasks.md. Use when fancy-flow
  has a stable proposal and the user is shaping a product, or when they mention
  design.md, prototype, demo.html, or splitting tasks. Do not write business
  code. Do not use for a small bugfix.
---

# Fancy Shape

Everything between "we know what to build" and "we may write business code". Init the repo, lock how it looks and behaves, then split work.

**Do not write product features here.** No replacing mocks with real backends. No expanding mocks. Do not invent `/grill-me`, `/prototype`, or other skills that are not in this collection — do the work in this skill.

## Gate in

Refuse unless `/fancy-orient` is done: `proposal.md` exists and the three questions are stable. If not, tell `/fancy-flow` to run `/fancy-orient`.

## Gate out (code-writing threshold)

All of these, then stop and return to `/fancy-flow`:

- [ ] `specs/<feature>/design.md` — or an explicit **no-UI** waiver in `decisions.md`
- [ ] **High-fidelity prototype** — the interactive contract (see branches). Not a screenshot, not a mockup-only Figma dump
- [ ] `specs/<feature>/decisions.md`
- [ ] `specs/<feature>/tasks.md` (atomic, ≤ 2h, verification on each row)

Until this gate is green, `/fancy-build` must not start.

## High-fidelity prototype (required)

This is a **core contract**, same rank as `design.md` and `tasks.md`. Later code must match it, not the other way around.

| Branch | When | What counts as the prototype |
| --- | --- | --- |
| **From scratch** | UI needed, no runnable UI yet | A clickable artifact (prefer `runs/<task>/artifacts/demo.html` or an equivalent single-route app) with realistic mock data. Pair with `contract.ts` (or equivalent types) so names and states are not string soup |
| **Existing prototype** | User already gave a runnable high-fidelity UI (React / Vue / Flutter, with mocks) | **Keep that UI.** Do not regenerate `demo.html`. Audit it: component list, mock-source list, MVP vs P2 table, Prototype → Task map. Reverse-extract `design.md` from the UI |
| **No UI** | Backend / CLI / no interface | Skip visual + prototype. Write `Prototype: none (no UI)` in `decisions.md`. `design.md` is not required |

Inside this skill, pick the branch from what the user actually has. Do not run 4 + 5 and 5.5.

## Sequence

1. **Init (step 3)** — follow [INIT.md](INIT.md). `git init` if none. Move `proposal.md`. Write a short `CLAUDE.md` (iron rules + start command only). Default **Mini**. Confirm stack in one sentence with the user.
2. **Visual + prototype (steps 4–5 / 5.5)** — follow the branch table and [ARTIFACTS.md](ARTIFACTS.md). From-scratch: lock `design.md`, then build the high-fidelity demo + `contract.ts`. Existing: audit, do not rewrite the UI. Show the demo to the user before splitting tasks.
3. **Split (step 6)** — survey whether a library already does the hard part (do not reinvent). Write `decisions.md` (chosen vs rejected), then `tasks.md` bound to acceptance intent. If the existing-prototype branch ran, tasks must include de-mock work; do not add tasks that grow the mock.

If the user is not technical, explain the stack choice and the task list in plain language and wait for a yes before declaring the gate green.

## Done when

The gate-out checklist is green. Tell `/fancy-flow` shape is complete. Do not start `/fancy-build` unless the user is still in a flow session and flow dispatches it.
