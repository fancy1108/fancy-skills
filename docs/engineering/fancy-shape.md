# Fancy Shape

## What it does

Fancy Shape is all preparation before business code: init the repo, lock visuals, produce a **high-fidelity prototype** as the interactive contract, then `decisions.md` and `tasks.md`.

The defining constraint: do not skip the diverge steps **or the human locks**. Init shows Micro / Mini / Pro as a menu. Visual first asks **vague / I have files / I have a prototype**, then (case 1) three Clutch Design presets. From-scratch prototype is demo → **user accepts, with optional polish** → contract. An existing runnable UI is audited, not replaced.

## When to reach for it

Type `/fancy-shape`, or let `/fancy-flow` reach it after a stable proposal.

## Prerequisites

`/fancy-orient` done. Three questions stable. `proposal.md` on disk **and accepted**.

## Common questions

**We already have a runnable UI. Do we still make demo.html?**
No. That is the 5.5 branch: keep the UI, extract `design.md` (tokens) and `visual.md` (screens + bans), write the mock map and P2 table.

**CLI-only product?**
Skip visual and prototype. Record `Prototype: none (no UI)` in `decisions.md`.

**design.md vs visual.md?**
`design.md` is the design spec (tokens, type, spacing). `visual.md` is this product's UI contract (screen map, states, bans). Do not dump screens into `design.md`.

**Does this call `/fancy-init`?**
No. Shape inits the product repo itself. `/fancy-init` is the optional conventions skill (issue tracker, glossary) and is user-invoked.

## It's working if

- `git init` happened only after orient, a **shown** Micro/Mini/Pro menu, and a confirmed stack.
- Visual asked **vague / files / prototype** before any demo. Case 1 used three Clutch Design presets, not empty A/B/C.
- A UI product has a clickable high-fidelity artifact (or the user's existing one) **that they accepted** before `contract.ts` / `tasks.md`.
- `/fancy-build` is still blocked until the gate is green.
- Saying Mini should have been Pro (or any earlier pick) rewinds that lock; it does not start a new product.

## Where it fits

The **code-writing threshold**. Neighbours: `/fancy-orient` before, `/fancy-build` after.
