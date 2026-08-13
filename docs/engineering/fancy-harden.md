# Fancy Harden

## What it does

Fancy Harden proves the product with physical evidence, then aligns drift (implementation, understanding, or definition). Testing and anti-drift are one loop.

Reality audit first: mock theatre. Then static, unit, the test-contract from shape against the real app, and the user using it once. Drift is diagnosed from files, diffs, and logs — not from the model's introspection. Fixes start from a failing test.

## When to reach for it

Type `/fancy-harden`, or let `/fancy-flow` dispatch it after tasks, or when acceptance feels wrong.

## Prerequisites

Code from `/fancy-build`. Happy path may be manual on a tiny tool; it still needs a log or screenshot.

## It's working if

- Mock theatre is caught.
- Drift is named (implementation / understanding / definition) with a quoted spec vs code.
- Bugs land in a test or `memory/FAILURES.md`.

## Where it fits

The **evidence loop**. Neighbours: `/fancy-build` before, `/fancy-ship` after.
