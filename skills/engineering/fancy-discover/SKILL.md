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

- **`/fancy-flow`** — assembler. Detects which stage is next. Today it only dispatches `/fancy-orient`.
- **`/fancy-orient`** — three questions, then `proposal.md`. Never `git init`.

Everything else in this collection is a skill Fancy uses or chose to keep. If the user wants something that is not listed below, say it is not in the collection yet — do not invent a missing skill.

<!-- BEGIN GENERATED INVENTORY -->
## Available skills

This list is generated from `.claude-plugin/plugin.json`. Do not edit it by hand.

**User-invoked**

- **`/fancy-discover`** — Discover the skills in this collection and which one to reach for.
- **`/fancy-init`** — Initialize this workspace with Fancy's conventions — issue tracker, domain docs, and Cursor rules.

**Model-invoked**

- **`/fancy-flow`** — Start or continue a product / vibe-coding pipeline. Use when the user wants to start a new product, execute a vibe coding workflow, or explicitly says continue in a project workspace. Do not use for one-shot questions, regex help, or a small bugfix.
- **`/fancy-orient`** — Find the problem, lock who / how painful / why now, and write proposal.md. Use when starting a new product, writing a proposal, vibe-coding step 1–2, or when fancy-flow needs the three questions answered. Do not create a git repo. Do not use for implementation or small bugfixes.
<!-- END GENERATED INVENTORY -->

## How to pick

| Situation | Reach for |
| --- | --- |
| Start a new product, vibe coding, or continue this product | `/fancy-flow` |
| Three questions / proposal only | `/fancy-orient` |
| This project has no `docs/agents/setup-state.json` and a skill needs a tracker or glossary | `/fancy-init` |
| "What's in this collection?" | You are already here |
| A skill that is not listed | Say it is not here yet |
