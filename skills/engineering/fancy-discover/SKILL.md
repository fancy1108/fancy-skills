---
name: fancy-discover
description: Discover the skills in this collection and which one to reach for.
disable-model-invocation: true
---

# Fancy Discover

This is Fancy's personal skill collection — skills in daily use, plus ones worth keeping. It grows as new ones earn a place.

## What's here

Housekeeping for a consuming repo:

- **`/fancy-init`** — initialize this workspace with Fancy's conventions (issue tracker, domain docs, Cursor rules). Idempotent: `docs/agents/setup-state.json` records completion, so a later run updates instead of appending.

Product pipeline (intent-triggered — the agent reaches these when you start a product or say continue, not on ordinary Q&A):

- **`/fancy-flow`** — assembler. Detects which stage is next and runs it.
- **`/fancy-orient`** — three questions, then `proposal.md`. Never `git init`.
- **`/fancy-shape`** — init, **high-fidelity prototype**, `design.md`, `decisions.md`, `tasks.md`. No business code.
- **`/fancy-build`** — one task from `tasks.md`, verify, next.
- **`/fancy-harden`** — evidence-backed test + drift alignment.
- **`/fancy-ship`** — release and memory.

In-progress stubs (video pipeline, curated-skill backlog) are **not** listed below. If the user wants those, say they are not shipped yet.

Everything else in this collection is a skill Fancy uses or chose to keep. If the user wants something that is not listed below, say it is not in the collection yet — do not invent a missing skill.

<!-- BEGIN GENERATED INVENTORY -->
## Available skills

This list is generated from `.claude-plugin/plugin.json`. Do not edit it by hand.

**User-invoked**

- **`/fancy-discover`** — Discover the skills in this collection and which one to reach for.
- **`/fancy-init`** — Initialize this workspace with Fancy's conventions — issue tracker, domain docs, and Cursor rules.

**Model-invoked**

- **`/fancy-build`** — Write business code one task at a time from tasks.md, verify with a real command, then take the next task. Use when fancy-flow has a complete shape gate, or the user is implementing the current task list. Do not start if design.md / prototype / tasks.md / decisions.md are missing. Do not use for writing the proposal.
- **`/fancy-flow`** — Start or continue a product / vibe-coding pipeline. Use when the user wants to start a new product, execute a vibe coding workflow, or explicitly says continue in a project workspace. Do not use for one-shot questions, regex help, or a small bugfix.
- **`/fancy-harden`** — Prove the product with physical evidence, then align drift: implementation, understanding, or definition. Use when fancy-flow has finished tasks, the user asks to test, or acceptance feels off. Do not accept verbal "tests passed". Do not use while still writing the proposal.
- **`/fancy-orient`** — Find the problem, lock who / how painful / why now, and write proposal.md. Use when starting a new product, writing a proposal, vibe-coding step 1–2, or when fancy-flow needs the three questions answered. Do not create a git repo. Do not use for implementation or small bugfixes.
- **`/fancy-shape`** — Prepare to write code: init the repo, lock visual contract, produce a high-fidelity prototype, then decisions.md and tasks.md. Use when fancy-flow has a stable proposal and the user is shaping a product, or when they mention design.md, prototype, demo.html, or splitting tasks. Do not write business code. Do not use for a small bugfix.
- **`/fancy-ship`** — Release the product and update memory: production config, rollback point, PROGRESS.md. Use when fancy-flow has hardened the build, or the user asks to deploy or close an iteration. Do not ship on mock data. Do not use at proposal time.
<!-- END GENERATED INVENTORY -->

## How to pick

| Situation | Reach for |
| --- | --- |
| Start a new product, vibe coding, or continue this product | `/fancy-flow` |
| Three questions / proposal only | `/fancy-orient` |
| Init, prototype, design, tasks | `/fancy-shape` |
| Implement the current task list | `/fancy-build` |
| Test / acceptance feels wrong | `/fancy-harden` |
| Deploy / close the iteration | `/fancy-ship` |
| This project has no `docs/agents/setup-state.json` and a skill needs a tracker or glossary | `/fancy-init` |
| "What's in this collection?" | You are already here |
| A skill that is not listed | Say it is not here yet |
