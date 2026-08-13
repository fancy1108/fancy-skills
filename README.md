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

### 2. Optional: `/connect`

If a project should share this collection's issue tracker, domain docs, and Cursor rules, run `/connect` once in that repo. Later runs update the existing files instead of appending.

### 3. See what's here

Run `/catalog` to list the skills in this collection.

## What's in the collection

These split on one axis — who can invoke them. **User-invoked** skills are reachable only when you type them. **Model-invoked** skills can be invoked by you or reached for automatically. A user-invoked skill may invoke model-invoked skills, but never another user-invoked one.

### Engineering

**User-invoked**

- **[catalog](./skills/engineering/catalog/SKILL.md)** — Show what's in this collection and which skill to reach for.
- **[connect](./skills/engineering/connect/SKILL.md)** — Wire this repo into the collection — issue tracker, domain docs, and Cursor rules.

**Model-invoked**

None yet. Skills I use or choose to keep will land here.

### Productivity

**User-invoked**

None yet.

**Model-invoked**

None yet.

## License

[MIT](./LICENSE)
