# Fancy Ship

## What it does

Fancy Ship releases and updates memory: production config, rollback hash, `PROGRESS.md`. It does not ship mock-backed UIs.

## When to reach for it

Type `/fancy-ship`, or let `/fancy-flow` dispatch it when harden is done.

## Prerequisites

Physical verification from `/fancy-harden`.

## It's working if

- A URL or an explicit local-only note exists.
- Rollback hash and memory files are updated.

## Where it fits

The **close**. Neighbour: `/fancy-harden` before; then the pipeline is idle.
