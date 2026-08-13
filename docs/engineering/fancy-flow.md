# Fancy Flow

## What it does

Fancy Flow is the intent-triggered assembler: it detects which pipeline stage is next and runs that skill. It does not load on ordinary chat.

The defining constraint: five stages, one at a time, **human locks between drafts**. A file on disk is not acceptance. Any lock can be taken back in natural language — rewind to that lock, smallest patch, do not restart from step 1. Orient researches before the three questions, then waits for the written proposal to be accepted. Shape owns init and the **high-fidelity prototype**, and waits for the user to accept the demo and `tasks.md`. Build may not start until that prototype (or a no-UI waiver) exists **and** they said the split is right.

A request to make an app or tool is a product start. A regex is not.

## When to reach for it

Type `/fancy-flow`, or the agent reaches for it when you start a product, run vibe coding, or say continue in a product workspace.

## Prerequisites

None. All five stage skills ship with this collection. Helper skills named in old notes are **not** in the collection — stages do that work themselves.

## Common questions

**Will a regex question get a proposal?**
No. The skill must decline the pipeline.

**Where is the high-fidelity prototype?**
It is a **shape** gate, not a build artifact. `/fancy-shape` produces it (or audits the one you already have).

**I picked Mini, now I want Pro.**
Yes. Say so in natural language. The agent rewinds to the tier lock, adds Pro files, does not `git init` again. Same for any other lock: proposal, visual, demo, tasks, a build row, ship plan.

**How do I try the pipeline?**
Empty folder, install this collection, say you want a small **UI** product. You should see: research before three questions; no `git init` until `proposal.md`; then visual directions and a clickable prototype before business code.

## It's working if

- New product → `/fancy-orient`, not `git init`, not three empty prompts.
- After proposal → stop until they accept it, then `/fancy-shape`.
- After a clickable prototype → stop until they accept it; do not jump to `contract.ts`.
- After init on a UI product → ask vague / files / existing prototype; no `demo.html` until that case is locked.
- Skip-to-code is refused until the shape gate is green.
- Saying an earlier decision was wrong rewinds to that lock instead of restarting the product.

## Where it fits

The **pipeline assembler**. Neighbours: the five stage skills it dispatches.
