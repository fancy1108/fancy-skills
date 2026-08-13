# Fancy Orient

## What it does

Fancy Orient finds product truth **before** a repo: research real complaints and competitors, then lock who / how painful / why now, then write `proposal.md`.

The defining constraint: first they say **what they want to make**. Then research that domain. Then the three questions. Then write `proposal.md` and **wait until they say it is right**. Do not open with pain interviews or the three questions.

## When to reach for it

Type `/fancy-orient`, or let `/fancy-flow` reach it when a new product has no proposal yet.

Reach for this at the start of a product, not for a bugfix in an existing repo.

## Prerequisites

A place to write a markdown file (current directory, a named path, or Obsidian). No git remote required. Web search for complaints.

## Common questions

**I already know what I want. Do I still hunt complaints?**
If you can already say who / how painful / why now in your own words, skip research. A product name alone is not enough — the agent still brings quotes and competitors so you can answer those three.

**Can the agent invent the three answers?**
No. It may propose from the evidence; you confirm. Unconfirmed answers do not open the gate.

**Search said 0 results / API Error: Content block not found.**
Claude Code `WebSearch` is an Anthropic server tool. It does not run on a third-party `ANTHROPIC_BASE_URL`. Orient hunts with `scripts/hunt.py` (local Bing HTML) instead. Do not retry `WebSearch`.

## It's working if

- The first question (if intent is unknown) is only "what do you want to make?" — not a pain interview.
- Research in that domain appears **before** the three questions, unless the skip rule hit.
- Pain quotes have URLs `scripts/hunt.py` actually returned. A failed hunt does not become a "domain knowledge" table.
- The three answers are in the user's words, in `proposal.md`, **and they accepted that file**.
- MVP is one capability and Non-Goals are written.
- `git init` did not run.

## Where it fits

The first **pipeline stage**. Neighbour: `/fancy-flow`, which calls it then `/fancy-shape` **after they accept the proposal**.
