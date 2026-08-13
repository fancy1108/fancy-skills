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

## Test (step 8)

In order:

1. **Reality audit** — kill mock theatre. If the UI still shows data with the backend down, it is acting. Fix or file tasks; do not ship it.
2. Static: lint / types, with command output.
3. Unit: core logic. Prefer a separate pass for hostile cases.
4. E2E / happy path: real commands, real output pasted or saved.
5. The user uses it once. Record anything that "feels wrong".

**Iron rules:** the model saying pass is not pass. The agent that wrote the feature should not be the only judge of the core path. Every bug becomes a test or a line in `memory/FAILURES.md`.

## Drift (step 8.5)

When acceptance does not match intent, do not introspect. Physical diagnosis:

1. Read `proposal.md` and `design.md` (and the prototype) for the feature.
2. Diff the implementation against that text.
3. Run the relevant test; read the log.

Then fix the right layer: code (implementation drift), your understanding vs theirs (understanding drift), or the spec that was too vague (definition drift — update the spec **and** the code).

## Done when

There is a verification log (commands + output), mock theatre is gone or explicitly waived, and open drift items are fixed or written as tasks. Tell `/fancy-flow`.
