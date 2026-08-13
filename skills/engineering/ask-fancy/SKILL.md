---
name: ask-fancy
description: Ask which skill or flow fits your situation. A router over the skills in this repo.
disable-model-invocation: true
---

# Ask Fancy

You don't remember every skill, so ask.

This repo is a **forge**: small, owned, composable skills. V1 ships the forge itself — install, route, and per-repo setup. Workflow skills land later in the promoted buckets.

## What exists now

Run **`/setup-fancy-skills`** once in a consuming repo before any other engineering flow. It writes the issue tracker, domain-doc layout, Cursor rules, and `docs/agents/setup-state.json`. If that file already says `setup_completed: true`, the skill reconfigures instead of appending.

There is no idea → ship chain yet. Do not invent `/grill-me`, `/tdd`, or `/to-spec`. If the user wants a workflow this repo does not ship, say so and stop.

<!-- BEGIN GENERATED INVENTORY -->
## Available skills

This list is generated from `.claude-plugin/plugin.json`. Do not edit it by hand.

**User-invoked**

- **`/ask-fancy`** — Ask which skill or flow fits your situation. A router over the skills in this repo.
- **`/setup-fancy-skills`** — Configure this repo for fancy-skills — issue tracker, domain doc layout, and Cursor rules. Run once before using the other engineering skills.

**Model-invoked**

None.
<!-- END GENERATED INVENTORY -->

## Planned buckets

- **engineering/** — daily code work. Setup lives here. More skills will be promoted into this bucket.
- **productivity/** — daily non-code workflow. Empty in v1.
- **in-progress/** — public beta, not in the plugin.
- **misc/** — kept, not promoted.
- **deprecated/** — no longer used.

## How to pick

| Situation | Reach for |
| --- | --- |
| First time in this repo, or `docs/agents/setup-state.json` is missing | `/setup-fancy-skills` |
| "Which skill should I use?" | You are already here |
| Anything this repo does not ship | Say so. Do not pretend a missing skill exists. |
