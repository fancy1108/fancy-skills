# Fancy Build

## What it does

Fancy Build implements `tasks.md` one row at a time and verifies with a real command log. It does not start without the shape gate, including the high-fidelity prototype.

Check-in first: progress file, failures, git log, then one open row. Scope stays on that row. It must not edit `specs/` to make a test pass. Check-out before the session ends.

## When to reach for it

Type `/fancy-build`, or let `/fancy-flow` dispatch it when tasks are open and shape is green.

## Prerequisites

Shape gate: `design.md` + `visual.md` or no-UI waiver, prototype or no-UI waiver, `tasks.md`, `decisions.md`.

## It's working if

- One task per loop, with command output, not "tests passed".
- Mocks are not expanded.
- A rotting session is stopped instead of patched forever.

## Where it fits

The **implementation loop**. Neighbours: `/fancy-shape` before, `/fancy-harden` after.
