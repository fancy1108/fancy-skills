# Ask Fancy

## What it does

Ask Fancy is the router over this repo. It names the skills that actually ship and how to pick among them. It does not invent workflows that are not in the generated inventory.

## When to reach for it

You invoke this by typing `/ask-fancy` — the agent won't reach for it on its own.

Reach for it when you cannot remember which skill fits, or when you are new to the set.

## Prerequisites

None. If the work needs a configured consuming repo, Ask Fancy will send you to `/setup-fancy-skills`.

## Common questions

**Why is the list so short?**
V1 is the forge — install, route, setup. Workflow skills are added later; the inventory is generated from `.claude-plugin/plugin.json` so it cannot claim skills that do not ship.

**Can I edit the inventory in SKILL.md?**
No. Change `plugin.json` and run `scripts/build-router.sh`.

## It's working if

- The agent only offers skills that are in the generated inventory.
- It sends a first-time repo to `/setup-fancy-skills`.
- It refuses to pretend `/grill-me` or `/tdd` exist here.

## Where it fits

A **reach-for-it-anytime standalone** that indexes the set. Neighbour: `/setup-fancy-skills`, because that is the only other promoted skill in v1.
