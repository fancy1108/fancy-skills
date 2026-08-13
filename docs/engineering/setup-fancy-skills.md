# Setup Fancy Skills

## What it does

Setup Fancy Skills writes the per-repo configuration other engineering skills assume: issue tracker, domain-doc layout, Cursor rules, and `docs/agents/setup-state.json`. The JSON file is the canonical "already initialized" marker — re-running the skill reconfigures; it does not append a second `## Agent skills` block.

## When to reach for it

You invoke this by typing `/setup-fancy-skills` — the agent won't reach for it on its own.

Reach for this once per consuming repo, before other engineering flows, or later when you want to switch trackers or repair a missing `setup-state.json`.

## Prerequisites

A git working directory you are willing to modify. Cursor rules are written under `.cursor/rules/`; an existing root `.cursorrules` is left untouched.

## Common questions

**I already ran it and the agent asked everything again.**
`docs/agents/setup-state.json` should have `setup_completed: true`. If that file is missing but `## Agent skills` exists, the skill is in repair mode — it should fill the JSON, not start from zero.

**Does this replace `.cursorrules`?**
No. It writes `.cursor/rules/fancy-skills.mdc` that *points at* `docs/agents/*.md`. Same constraints as CLI agents, no duplicated prose.

## It's working if

- `docs/agents/setup-state.json` exists with `setup_completed: true`.
- `CLAUDE.md` or `AGENTS.md` has exactly one `## Agent skills` section.
- `.cursor/rules/fancy-skills.mdc` points at `docs/agents/issue-tracker.md` and `docs/agents/domain.md`.

## Where it fits

A **run-once setup**. Neighbour: `/ask-fancy`, the router that sends first-time repos here.
