# Fancy Skills

Small, owned, composable agent skills. You keep control of the process; the skills stay easy to hack.

V1 is the **forge**: install, a router, and one-time per-repo setup. Workflow skills land later.

## 中文简介

这是我自己的 Agent Skills 仓库：技能小、可改、可组合。第一版先交付安装方式、路由器 `/ask-fancy`，以及每个消费仓库跑一次的 `/setup-fancy-skills`（幂等，并写入 Cursor 规则）。工作流技能之后再晋升进 `engineering/` 或 `productivity/`。

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

Pick the skills you want, and which coding agents to install them on. **Make sure `setup-fancy-skills` is one of them.**

### 2. Run `/setup-fancy-skills`

In your agent, run it once per consuming repo. It will:

- Ask which issue tracker you use (GitHub, GitLab, or local files)
- Ask where domain docs should live
- Write Cursor rules that point at the same files CLI agents read
- Record completion in `docs/agents/setup-state.json` so a later run reconfigures instead of appending

### 3. Done.

Unsure which skill to use? Run `/ask-fancy`.

## Reference

These split on one axis — who can invoke them. **User-invoked** skills are reachable only when you type them. **Model-invoked** skills can be invoked by you or reached for automatically. A user-invoked skill may invoke model-invoked skills, but never another user-invoked one.

### Engineering

**User-invoked**

- **[ask-fancy](./skills/engineering/ask-fancy/SKILL.md)** — Ask which skill or flow fits your situation. A router over the skills in this repo.
- **[setup-fancy-skills](./skills/engineering/setup-fancy-skills/SKILL.md)** — Configure this repo for fancy-skills — issue tracker, domain doc layout, and Cursor rules.

**Model-invoked**

None yet.

### Productivity

**User-invoked**

None yet.

**Model-invoked**

None yet.

## License

[MIT](./LICENSE)
