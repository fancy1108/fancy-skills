---
name: fancy-shape
description: >-
  Prepare to write code: init the repo, lock visual contract, produce a
  high-fidelity prototype, then decisions.md and tasks.md. Use when fancy-flow
  has a stable proposal and the user is shaping a product, or when they mention
  design.md, prototype, demo.html, or splitting tasks. Do not write business
  code. Do not skip visual directions or the clickable demo. Do not use for a
  small bugfix.
---

# Fancy Shape

Everything between "we know what to build" and "we may write business code". Init the repo, lock how it looks and behaves, then split work.

**Do not write product features here.** No replacing mocks with real backends. No expanding mocks. **Do not invent helper skills that are not in this collection** — do the work here. Optional harness skills (`taste`, `impeccable`) may be invoked **if installed**; if they are missing, polish inside [VISUAL.md](VISUAL.md). Do not pretend they shipped with fancy-skills.

**Do not open** by picking a stack, writing `design.md`, writing `demo.html`, or splitting `tasks.md`. Same rule as orient: show options and evidence, then lock.

## Gate in

Refuse unless `/fancy-orient` is done: `proposal.md` exists and the three questions are stable. If not, tell `/fancy-flow` to run `/fancy-orient`.

Init has a **third** layer on top of that (stack + start command + which agent). If any is missing, stay in init. Do not `git init` on a guess.

## Gate out (code-writing threshold)

All of these, then stop and return to `/fancy-flow`:

- [ ] `specs/<feature>/design.md` — or an explicit **no-UI** waiver in `decisions.md`
- [ ] **High-fidelity prototype** — the interactive contract (see branches). Not a screenshot, not a mockup-only dump
- [ ] From-scratch UI: `contract.ts` + a test-contract draft (`e2e_spec.js` or unit spec) + `gate_report.md`
- [ ] Existing UI: component list, mock-source list, MVP vs P2 table, Prototype → Task map
- [ ] `specs/<feature>/decisions.md`
- [ ] `specs/<feature>/tasks.md` (atomic, ≤ 2h, verification on each row)

Until this gate is green, `/fancy-build` must not start.

## High-fidelity prototype (required)

This is a **core contract**, same rank as `design.md` and `tasks.md`. Later code must match it, not the other way around.

| Branch | When | What counts as the prototype |
| --- | --- | --- |
| **From scratch** | UI needed, no runnable UI yet | A clickable artifact (prefer `runs/<task>/artifacts/demo.html` or an equivalent single-file demo) with realistic mock data |
| **Existing prototype** | User already gave a runnable high-fidelity UI with mocks | **Keep that UI.** Do not regenerate `demo.html`. Audit it |
| **No UI** | Backend / CLI / no interface | Skip visual + prototype. Write `Prototype: none (no UI)` in `decisions.md`. `design.md` is not required |

Pick the branch from what the user actually has. Do not run 4 + 5 and 5.5.

If they name an earlier lock (wrong proposal, change the demo, redo tasks), rewind — do not keep walking this sequence. `/fancy-flow` owns the rewind map.

## Sequence (do not reorder)

1. **Init (step 3)** — [INIT.md](INIT.md). Paste Micro / Mini / Pro as labeled options (table or A/B/C), then you may recommend one. Default Mini only if they shrug after seeing all three. Confirm stack, start command, and agent the same way. Then `git init`, move `proposal.md`, short `CLAUDE.md`, first commit. Empty shell only. **Stop the turn.** Do not start visual or the demo in the same turn as `git init`.
2. **Visual (step 4, UI only)** — [VISUAL.md](VISUAL.md). **Stop.** Ask the three cases (vague / files / existing prototype). Case 1: three Clutch Design presets as A/B/C, wait. Case 2: wait for `design.md` or images. Case 3: wait for the prototype path, then 5.5. Do not write `demo.html` before that lock. A vibe word is not a pick.
3. **Contract (step 5 or 5.5)** — [ARTIFACTS.md](ARTIFACTS.md). From-scratch: only after `design.md` from case 1 or 2. Demo → **stop, user looks, polish if they want (`taste` / `impeccable` if installed)** → accept → `contract.ts` → test-contract draft → `gate_report.md`. Existing: four-step audit, do not rewrite the UI, wait for them to accept the tables. No-UI: skip to split.
4. **Split (step 6)** — Show a short library/survey (at least two options, chosen vs rejected). Then `decisions.md`, then `memory/ARCHITECTURE.md` if Mini+, then `tasks.md`. **Stop.** Ask if the split is right. Existing-prototype tasks include de-mock work; do not add tasks that grow the mock.

If the user is not technical, explain stack and tasks in plain language. **Everyone** waits for a yes before the gate is green — not only non-technical users.

## Done when

The gate-out checklist is green **and** they accepted the prototype and `tasks.md`. Tell `/fancy-flow` shape is complete. Do not start `/fancy-build` in the same turn.
