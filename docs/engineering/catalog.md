# Catalog

## What it does

Catalog lists the skills in this collection and which one to reach for. It only names skills that actually ship. It does not invent a workflow that is not in the generated inventory.

## When to reach for it

You invoke this by typing `/catalog` — the agent won't reach for it on its own.

Reach for it when you want to know what Fancy keeps in this collection.

## Prerequisites

None. If a project needs tracker or glossary files, Catalog will point you at `/connect`.

## Common questions

**Why is the list short?**
This is a personal collection. Skills land here when Fancy uses them or decides they are worth keeping. The inventory is generated from `.claude-plugin/plugin.json`, so it cannot claim skills that do not ship.

**Can I edit the inventory in SKILL.md?**
No. Change `plugin.json` and run `scripts/build-router.sh`.

## It's working if

- The agent only offers skills that are in the generated inventory.
- It points a project that needs tracker/glossary files to `/connect`.
- It refuses to pretend a skill that is not listed exists.

## Where it fits

A **reach-for-it-anytime** index of the collection. Neighbour: `/connect`, when a consuming repo needs the shared files.
