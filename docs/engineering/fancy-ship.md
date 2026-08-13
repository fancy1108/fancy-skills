# Fancy Ship

## What it does

Fancy Ship releases and updates memory: production config, rollback hash, `PROGRESS.md`, and **which stage the next iteration starts at**. It does not ship mock-backed UIs.

A toy may ship **local-only** if that is written down (how to run it, no URL). Public products still need env, secrets stripped, and a rollback hash.

## When to reach for it

Type `/fancy-ship`, or let `/fancy-flow` dispatch it when harden is done.

## Prerequisites

Physical verification from `/fancy-harden`.

## It's working if

- A URL or an explicit local-only note exists.
- Rollback hash and memory files are updated.
- The next stage is named (orient / shape / build).
- `CLAUDE.md` stayed a short operations file.

## Where it fits

The **close**. Neighbour: `/fancy-harden` before; then the pipeline is idle until the named next stage.
