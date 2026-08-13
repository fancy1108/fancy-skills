---
name: fancy-harden
description: >-
  Prove the product with physical evidence, then align drift: implementation,
  understanding, or definition. Use when fancy-flow has finished tasks, the
  user asks to test, or acceptance feels off. Do not accept verbal "tests
  passed". Do not use while still writing the proposal.
---

# Fancy Harden

Test and drift-alignment are one loop: catch a lie (mock theatre, missing path), fix it, lock a regression. Claims are not evidence.

## Gate in

Prefer after `/fancy-build`. A small tool may skip heavy automation, but the happy path must be walked with a log or a screenshot.

## Iron rules

1. The model saying pass is not pass. Need a command log, network trace, or screenshot.
2. The agent that wrote the feature should not be the only judge of the core path. Prefer a fresh session for hostile cases and e2e when the user can open one.
3. Every bug becomes a test or a line in `memory/FAILURES.md`.
4. If the UI still shows data with the backend down, it is acting. Fix or file tasks; do not ship it.
5. Evidence > explanations. No log → treat the test as not run.

## Test (step 8)

In order — do not start at unit tests:

1. **Reality audit** — grep for mock / fakeData / hardcoded fixtures / `setTimeout` pretending to be a network. List path, purpose, keep-or-replace. Show one real request log if there is a backend.
2. Static: lint / types, with command output.
3. Unit: core logic. Prefer a separate pass for hostile cases (empty, overflow, bad input).
4. E2E / happy path: run (or retarget) the test-contract from shape against the real app. Real commands, real output pasted or saved.
5. The user uses it once. Record anything that "feels wrong". **Stop** until they have used it (or they explicitly skip). Do not tell `/fancy-flow` to ship in the same turn.

The test-contract from shape is the exam paper. Do not write a new suite that only agrees with the code you just wrote.

## Drift (step 8.5)

When acceptance does not match intent, do not introspect. Physical diagnosis **before** any edit:

1. Read `proposal.md` and `design.md` (and the prototype) for the feature — quote the lines.
2. Diff the implementation against that text.
3. Run the relevant test; read the log.

Name the drift:

| Kind | Meaning | Fix |
| --- | --- | --- |
| Implementation | Spec right, code wrong | Failing test first, then fix code |
| Understanding | Code matches a wrong reading of the user | Align with the user, then code |
| Definition | Spec was too vague | Update spec **and** tasks **and** code. Failing test for the new rule first |

Keep four places in sync in one pass: spec, code, test, and `memory/ARCHITECTURE.md` / README if those files exist.

Mini+: append anti-drift iron rules to `CLAUDE.md` (physical diagnosis before speculation; no verbal "fixed"; tests are the truth). Do not invent Husky/CI on a Micro repo; Pro may add a pre-commit test hook if none exists.

## Done when

There is a verification log (commands + output), mock theatre is gone or explicitly waived, open drift items are fixed or written as tasks, Mini+ `CLAUDE.md` has the anti-drift lines, **and the user used it once**. Tell `/fancy-flow`. Do not start `/fancy-ship` in the same turn.
