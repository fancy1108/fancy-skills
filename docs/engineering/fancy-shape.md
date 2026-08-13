# Fancy Shape

## What it does

Fancy Shape is all preparation before business code: init the repo, lock visuals, produce a **high-fidelity prototype** as the interactive contract, then `decisions.md` and `tasks.md`.

The defining constraint: the prototype is a gate, not a nice-to-have. From scratch it is a clickable demo; if you already have a runnable UI, that UI **is** the prototype and must be audited, not replaced.

Init defaults to **Mini** (`CLAUDE.md` + `specs/core/proposal.md` + `memory/PROGRESS.md`). `CLAUDE.md` gets Pitch + iron rules + start command only — not the whole proposal.

## When to reach for it

Type `/fancy-shape`, or let `/fancy-flow` reach it after a stable proposal.

## Prerequisites

`/fancy-orient` done. Three questions stable. `proposal.md` on disk.

## Common questions

**We already have a React prototype. Do we still make demo.html?**
No. That is the 5.5 branch: keep the UI, extract `design.md`, write the mock map and P2 table.

**CLI-only product?**
Skip visual and prototype. Record `Prototype: none (no UI)` in `decisions.md`.

**Does this call `/fancy-init`?**
No. Shape inits the product repo itself. `/fancy-init` is the optional conventions skill (issue tracker, glossary) and is user-invoked.

## It's working if

- `git init` happened only after orient.
- A UI product has a clickable high-fidelity artifact (or the user's existing one).
- `tasks.md` exists and `/fancy-build` is still blocked until that is true.

## Where it fits

The **code-writing threshold**. Neighbours: `/fancy-orient` before, `/fancy-build` after.
