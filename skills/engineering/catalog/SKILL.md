---
name: catalog
description: Show what's in this collection and which skill to reach for.
disable-model-invocation: true
---

# Catalog

This is Fancy's personal skill collection — skills in daily use, plus ones worth keeping. It grows as new ones earn a place.

## What's here

Housekeeping for a consuming repo:

- **`/connect`** — write issue-tracker, domain-doc, and Cursor-rule files into the current project. Idempotent: `docs/agents/setup-state.json` records completion, so a later run updates instead of appending.

Everything else in this collection is a skill Fancy uses or chose to keep. If the user wants something that is not listed below, say it is not in the collection yet — do not invent a missing skill.

<!-- BEGIN GENERATED INVENTORY -->
## Available skills

This list is generated from `.claude-plugin/plugin.json`. Do not edit it by hand.

**User-invoked**

- **`/catalog`** — Show what's in this collection and which skill to reach for.
- **`/connect`** — Wire this repo into the collection — issue tracker, domain docs, and Cursor rules. Run once per project if you want those conventions.

**Model-invoked**

None.
<!-- END GENERATED INVENTORY -->

## How to pick

| Situation | Reach for |
| --- | --- |
| This project has no `docs/agents/setup-state.json` and a skill needs a tracker or glossary | `/connect` |
| "What's in this collection?" | You are already here |
| A skill that is not listed | Say it is not here yet |
