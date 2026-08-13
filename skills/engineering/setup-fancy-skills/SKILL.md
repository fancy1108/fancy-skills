---
name: setup-fancy-skills
description: Configure this repo for fancy-skills — issue tracker, domain doc layout, and Cursor rules. Run once before using the other engineering skills.
disable-model-invocation: true
---

# Setup Fancy Skills

Scaffold the per-repo configuration that the engineering skills assume:

- **Issue tracker** — where issues live (GitHub by default; local markdown is also supported)
- **Domain docs** — where `CONTEXT.md` and ADRs live, and the consumer rules for reading them
- **Cursor rules** — a pointer file so the GUI editor shares the same constraints as CLI agents
- **Setup state** — `docs/agents/setup-state.json`, the canonical "already initialized" marker

This is a prompt-driven skill, not a deterministic script. Explore, present what you found, confirm with the user, then write.

**Never append a second `## Agent skills` block.** If that heading already exists, replace that section in place.

## Setup state (read this first)

The consuming repo's authority is `docs/agents/setup-state.json`. Do **not** treat an HTML comment in `CLAUDE.md` / `AGENTS.md` as a substitute.

After reading the file (or noting it is missing), pick **exactly one** branch:

| Condition | Branch |
| --- | --- |
| File exists and `setup_completed` is `true` | **Reconfigure** — show the current values from the JSON and from `docs/agents/*.md`. Ask: update, or stop. If they stop, write nothing. If they update, re-run the sections they want changed, then rewrite the JSON, the `## Agent skills` section (in place), Cursor rules, and the `docs/agents/*.md` files you touched. |
| File missing, but `## Agent skills` exists in `CLAUDE.md` or `AGENTS.md`, **or** `docs/agents/` already has `issue-tracker.md` / `domain.md` | **Repair** — infer current choices from those files, write `docs/agents/setup-state.json` to match, show the inferred values, ask whether to change anything. Do **not** re-interview from scratch. |
| File missing and no Agent skills section / no `docs/agents` config files | **Fresh** — full explore → confirm → write. |

`setup_version` is `1` for this skill. Do not invent other versions.

## Process

### 1. Explore

Look at the current repo. Read whatever exists; don't assume:

- `docs/agents/setup-state.json` — branch on it as above
- `git remote -v` and `.git/config` — is this a GitHub repo? GitLab? Which one?
- `AGENTS.md` and `CLAUDE.md` at the repo root — does either exist? Is there already an `## Agent skills` section?
- `CONTEXT.md` and `CONTEXT-MAP.md` at the repo root
- `docs/adr/` and any `src/*/docs/adr/` directories
- `docs/agents/` — prior output of this skill
- `.cursor/rules/` and `.cursorrules` — do not overwrite an existing root `.cursorrules`
- `.scratch/` — sign that a local-markdown issue tracker is already in use
- Is a `triage` skill installed? (a `triage` skill folder alongside this one, or `triage` in available skills.) If it is **not**, skip triage labels entirely.
- Monorepo signals — `pnpm-workspace.yaml`, `package.json` `workspaces`, or a populated `packages/*` with its own `src/`. Absence means single-context.

### 2. Present findings and ask

Summarise what's present and what's missing. On the **Fresh** branch, take the sections in order — one section, one answer, then the next. On **Reconfigure** / **Repair**, only ask about the parts they want to change.

Lead each section with the recommended answer so the user can accept it in a word. Skip a section when exploration already settled it (Section B when `triage` isn't installed, Section C when there's no monorepo).

**Section A — Issue tracker.**

> Explainer: The issue tracker is where issues live for this repo. Skills that create or move work need to know whether to call `gh issue create`, write a markdown file under `.scratch/`, or follow a workflow you describe.

Default posture: if a `git remote` points at GitHub, propose GitHub. If it points at GitLab (`gitlab.com` or a self-hosted host), propose GitLab. Otherwise (or if the user prefers), offer:

- **GitHub** — issues live in the repo's GitHub Issues (uses the `gh` CLI)
- **GitLab** — issues live in the repo's GitLab Issues (uses the `glab` CLI)
- **Local markdown** — issues live as files under `.scratch/` in this repo
- **Other** (Jira, Linear, etc.) — ask the user to describe the workflow in one paragraph; record it as freeform prose

Record the choice in `docs/agents/issue-tracker.md`.

**Section B — Triage label vocabulary.** Skip entirely if the `triage` skill isn't installed.

If it is installed, ask exactly one question:

> Do you want to keep the default triage labels? (recommended: **yes**)

Defaults, each label string equal to its name: `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`. On **yes**, write them as-is. Only if the user says no, collect overrides.

**Section C — Domain docs.** Default to **single-context** — one `CONTEXT.md` + `docs/adr/` at the repo root. This fits almost every repo; write it without asking.

Offer **multi-context** — a root `CONTEXT-MAP.md` pointing to per-context `CONTEXT.md` files — only when exploration found monorepo signals. Then confirm which layout they want.

### 3. Confirm and edit

Show the user a draft of:

- The `## Agent skills` block to add or replace
- `docs/agents/issue-tracker.md`, `docs/agents/domain.md`, and `docs/agents/triage-labels.md` (the last only when `triage` is installed)
- `.cursor/rules/fancy-skills.mdc`
- `docs/agents/setup-state.json`

Let them edit before writing.

### 4. Write

**Pick the file to edit for `## Agent skills`:**

- If `CLAUDE.md` exists, edit it.
- Else if `AGENTS.md` exists, edit it.
- If neither exists, ask the user which one to create — don't pick for them.

Never create `AGENTS.md` when `CLAUDE.md` already exists (or vice versa) — always edit the one that's already there.

If an `## Agent skills` block already exists, **replace that section in place**. Do not append a duplicate. Don't overwrite user edits to surrounding sections.

The block:

```markdown
## Agent skills

### Issue tracker

[one-line summary of where issues are tracked]. See `docs/agents/issue-tracker.md`.

### Triage labels

[one-line summary of the label vocabulary]. See `docs/agents/triage-labels.md`.

### Domain docs

[one-line summary of layout — "single-context" or "multi-context"]. See `docs/agents/domain.md`.

Cursor reads the same files via `.cursor/rules/fancy-skills.mdc`.
```

Include the `### Triage labels` sub-block, and write `docs/agents/triage-labels.md`, only when `triage` is installed and Section B ran. When it isn't, both are omitted.

Then write the docs files using the seed templates in this skill folder:

- [issue-tracker-github.md](./issue-tracker-github.md)
- [issue-tracker-gitlab.md](./issue-tracker-gitlab.md)
- [issue-tracker-local.md](./issue-tracker-local.md)
- [triage-labels.md](./triage-labels.md) — only if `triage` is installed
- [domain.md](./domain.md)

For "other" issue trackers, write `docs/agents/issue-tracker.md` from scratch using the user's description.

**Cursor rules.** Write `.cursor/rules/fancy-skills.mdc` from [cursor-rule.mdc](./cursor-rule.mdc). Create `.cursor/rules/` if needed. If a root `.cursorrules` already exists, leave it untouched — the `.mdc` file sits alongside it. Never create a new root `.cursorrules`.

**Setup state.** Write `docs/agents/setup-state.json`:

```json
{
  "setup_completed": true,
  "setup_version": 1,
  "initialized_at": "<ISO-8601 now>",
  "issue_tracker": "github | gitlab | local | other",
  "domain_layout": "single-context | multi-context"
}
```

Use the actual choice strings. Omit `triage` from this file unless Section B ran; if it ran, you may add `"triage_labels": "default"` or `"custom"`.

### 5. Done

Tell the user setup is complete (or reconfigured) and which files were written. Mention they can edit `docs/agents/*.md` directly later — re-running this skill is only necessary to switch trackers, change domain layout, or repair a missing `setup-state.json`.
