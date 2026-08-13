# The canonical install block (English)

One install story, one wording. `README.md` must say **this** and nothing else. Change it here first, then copy into the English README.

Chinese wording lives in [install-block.zh-CN.md](./install-block.zh-CN.md) and is copied into `README.zh-CN.md`. Do not mix the two languages in one README.

The two routes are exclusive. The Claude Code plugin is a managed bundle. skills.sh copies editable skill files into a project. Installing both leaves every skill twice — always say "pick one".

## Claude Code — the plugin

This repo is **not** on Claude Code's official marketplace. Add this repo as a marketplace, then install the plugin. Claude reads `.claude-plugin/marketplace.json` (the catalog), not `plugin.json`.

Preferred — GitHub shorthand:

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

## Codex, Cursor, and other agents — skills.sh

```bash
npx skills@latest add fancy1108/fancy-skills
```

Pick the skills you want, and which coding agents to install them on.

Single-skill form:

```bash
npx skills@latest add fancy1108/fancy-skills --skill=fancy-discover
```

```bash
npx skills@latest update fancy-discover
```

## Language

Skill instructions load in **English** by default. `npx skills` cannot ask this. After install, switch to Simplified Chinese:

```
/fancy-locale
```

Or:

```bash
bash .claude/skills/fancy-locale/scripts/set-locale.sh zh-CN
```

Some agents copy into `.agents/skills` — use that path if `.claude/skills` is missing. **Start a new chat** after switching.
