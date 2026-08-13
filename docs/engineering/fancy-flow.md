# Fancy Flow

## What it does

Fancy Flow is the intent-triggered assembler for this collection's product pipeline. It looks at the workspace, runs the next shipped stage, and stops at gates. It does **not** load on ordinary chat.

The defining constraint: it only wakes for a new product, a vibe-coding workflow, or an explicit continue in a product workspace — never for a regex, a traceback, or a one-file fix.

## When to reach for it

Type `/fancy-flow`, or the agent reaches for it automatically when a task fits those triggers.

Reach for this when you want the pipeline to drive, not when you want a Q&A assistant.

## Prerequisites

None. Today the only shipped stage is `/fancy-orient`. Later stages are named, not faked.

## Common questions

**Will this hijack a small bugfix?**
No. The description and the skill both refuse one-shot work. If it still fires, it must decline the pipeline and answer the question.

**Why can't it start the git repo after the proposal?**
The handshake is "three questions locked + `proposal.md`". Creating a repo is a later stage that is not shipped yet. Fancy Flow will not `git init` to look helpful.

## It's working if

- A "let's start a new product" message leads to `/fancy-orient`, not to `git init`.
- A regex question never produces a demand for `proposal.md`.
- After a stable proposal, the agent stops and says the next stage is not shipped.

## Where it fits

The **pipeline assembler**. Neighbour: `/fancy-orient`, the only stage it can dispatch today.
