# Fancy Flow

## What it does

Fancy Flow is the intent-triggered assembler: it detects which pipeline stage is next and runs that skill. It does not load on ordinary chat.

The defining constraint: five stages, one at a time, hard gates. Orient has no git repo. Shape owns init and the **high-fidelity prototype**. Build may not start until that prototype (or a no-UI waiver) exists.

## When to reach for it

Type `/fancy-flow`, or the agent reaches for it when you start a product, run vibe coding, or say continue in a product workspace.

## Prerequisites

None. All five stage skills are shipped and model-invoked so this assembler can call them.

## Common questions

**Will a regex question get a proposal?**
No. The skill must decline the pipeline.

**Where is the high-fidelity prototype?**
It is a **shape** gate, not a build artifact. `/fancy-shape` produces it (or audits the one you already have).

## It's working if

- New product → `/fancy-orient`, not `git init`.
- After proposal → `/fancy-shape`, which will not skip the prototype on a UI product.
- Skip-to-code is refused until the shape gate is green.

## Where it fits

The **pipeline assembler**. Neighbours: the five stage skills it dispatches.
