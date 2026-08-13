# Fancy Skills

This is my personal collection of Agent Skills — ones I use myself, and ones I think are worth keeping. Small, editable, composable. I'll add more as I find them.

[English](README.md) · [简体中文](README.zh-CN.md)

## Installation

Two ways in. **Pick one** — installing both leaves you with every skill twice.

The Claude Code plugin is a managed bundle. [skills.sh](https://skills.sh/fancy1108/fancy-skills) copies editable skill files into your project.

### 1. Get the skills

**Claude Code**

This repo is not on Claude Code's official marketplace. Add it, then install the plugin. Claude reads `.claude-plugin/marketplace.json` (the catalog), not `plugin.json`.

```bash
claude plugin marketplace add fancy1108/fancy-skills
claude plugin install fancy-skills@fancy
```

Or, from inside a session:

```
/plugin marketplace add fancy1108/fancy-skills
/plugin install fancy-skills@fancy
```

Fallback — if GitHub clone / API fails, point at the **marketplace.json** Raw URL (never `plugin.json`):

```bash
claude plugin marketplace add https://raw.githubusercontent.com/fancy1108/fancy-skills/main/.claude-plugin/marketplace.json
claude plugin install fancy-skills@fancy
```

**Codex, Cursor, and other agents**

```bash
npx skills@latest add fancy1108/fancy-skills
```

Pick the skills you want, and which coding agents to install them on.

### 2. Optional: `/fancy-init`

If a project should use Fancy's conventions (issue tracker, domain docs, Cursor rules), run `/fancy-init` once in that workspace. Later runs update the existing files instead of appending.

### 3. See what's here

Run `/fancy-discover` to explore the skills in this collection.

To start a product (not a one-shot question), say so — `/fancy-flow` is **model-invoked** and will take the pipeline from there. It will not hijack a regex or a small bugfix.

## What's in the collection

These split on one axis — who can invoke them. **User-invoked** skills are reachable only when you type them. **Model-invoked** skills can be invoked by you or reached for automatically. A user-invoked skill may invoke model-invoked skills, but never another user-invoked one.

### Engineering

**User-invoked**

- **[fancy-discover](./skills/engineering/fancy-discover/SKILL.md)** — Discover the skills in this collection and which one to reach for.
- **[fancy-init](./skills/engineering/fancy-init/SKILL.md)** — Initialize this workspace with Fancy's conventions — issue tracker, domain docs, and Cursor rules.

**Model-invoked**

- **[fancy-flow](./skills/engineering/fancy-flow/SKILL.md)** — Start or continue a product / vibe-coding pipeline. Intent-triggered; not for regex or a one-file bugfix.
- **[fancy-orient](./skills/engineering/fancy-orient/SKILL.md)** — Research complaints first, then lock who / how painful / why now, and write proposal.md. No git repo.
- **[fancy-shape](./skills/engineering/fancy-shape/SKILL.md)** — Init, three visual directions then high-fidelity prototype as contract, then decisions.md and tasks.md. No business code.
- **[fancy-build](./skills/engineering/fancy-build/SKILL.md)** — Write business code one task at a time from tasks.md.
- **[fancy-harden](./skills/engineering/fancy-harden/SKILL.md)** — Physical tests and drift alignment. Evidence, not claims.
- **[fancy-ship](./skills/engineering/fancy-ship/SKILL.md)** — Release and update memory.

### Productivity

**User-invoked**

None yet.

**Model-invoked**

None yet.

## License

[MIT](./LICENSE)
