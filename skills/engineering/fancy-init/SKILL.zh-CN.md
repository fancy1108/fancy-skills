---
name: fancy-init
description: 按 Fancy 的规范初始化当前工作区 — 议题跟踪、领域文档、Cursor 规则。
disable-model-invocation: true
---

# Fancy Init

按 Fancy 的标准初始化当前工作区。当技能需要共享的议题跟踪或词汇表时，写入本集合期望的仓库文件：

- **议题跟踪** — 议题放在哪（默认 GitHub；也支持本地 markdown）
- **领域文档** — `CONTEXT.md` 和 ADR 放在哪，以及读它们的规则
- **Cursor 规则** — 指针文件，让图形编辑器和 CLI Agent 受同一套约束
- **安装状态** — `docs/agents/setup-state.json`，权威的「已经初始化过」标记

这是提示驱动的技能，不是确定性脚本。先探索、展示发现、和用户确认，再写。

**永远不要追加第二段 `## Agent skills`。** 若标题已存在，就地替换该节。

对用户用中文提问。本目录里的模板文件可能仍是英文，按同样流程填，不要把模板原文甩给用户当最终说明。

## 安装状态（先读这个）

消费仓库的权威是 `docs/agents/setup-state.json`。**不要**把 `CLAUDE.md` / `AGENTS.md` 里的 HTML 注释当替代。

读完该文件（或确认缺失）后，只走 **恰好一条** 分支：

| 条件 | 分支 |
| --- | --- |
| 文件存在且 `setup_completed` 为 `true` | **再配置** — 展示 JSON 和 `docs/agents/*.md` 的当前值。问：更新，还是停。停则什么都不写。更新则重跑他们要改的节，然后重写 JSON、就地替换 `## Agent skills`、Cursor 规则，以及你动过的 `docs/agents/*.md`。 |
| 文件缺失，但 `CLAUDE.md` 或 `AGENTS.md` 里已有 `## Agent skills`，**或者** `docs/agents/` 已有 `issue-tracker.md` / `domain.md` | **修复** — 从那些文件推断当前选择，写出匹配的 `docs/agents/setup-state.json`，展示推断值，问要不要改。**不要**从头再面谈一遍。 |
| 文件缺失，且没有 Agent skills 节 / 没有 `docs/agents` 配置文件 | **全新** — 完整探索 → 确认 → 写入。 |

本技能的 `setup_version` 是 `1`。不要发明别的版本。

## 流程

### 1. 探索

看当前仓库。有什么读什么；不要假设：

- `docs/agents/setup-state.json` — 按上表分支
- `git remote -v` 和 `.git/config` — GitHub？GitLab？哪一个？
- 根目录 `AGENTS.md` 和 `CLAUDE.md` — 有没有？有没有 `## Agent skills` 节？
- 根目录 `CONTEXT.md` 和 `CONTEXT-MAP.md`
- `docs/adr/` 以及任何 `src/*/docs/adr/`
- `docs/agents/` — 本技能以前的产出
- `.cursor/rules/` 和 `.cursorrules` — 不要覆盖已有的根 `.cursorrules`
- `.scratch/` — 说明已经在用本地 markdown 议题
- 有没有安装 `triage` 技能？没有则整节跳过标签词汇。
- 单仓还是多包 — `pnpm-workspace.yaml`、`package.json` 的 `workspaces`、或 `packages/*` 自带 `src/`。没有就是单一上下文。

### 2. 展示发现并提问

总结有什么、缺什么。**全新**分支按节来 — 一节一答，再下一节。**再配置** / **修复** 只问他们要改的部分。

每节先给推荐答案，让用户一句话就能同意。探索已经定下来的节就跳过（没有 `triage` 则跳 B；不是 monorepo 则跳 C）。

**A — 议题跟踪。**

说明：议题跟踪是本仓库议题住的地方。会创建或移动工作的技能需要知道该调 `gh issue create`、往 `.scratch/` 写 markdown，还是按你描述的流程走。

默认姿态：`git remote` 指向 GitHub 就提议 GitHub；指向 GitLab 就提议 GitLab。否则（或用户更想）提供：

- **GitHub** — 议题在该仓库的 GitHub Issues（用 `gh`）
- **GitLab** — 议题在该仓库的 GitLab Issues（用 `glab`）
- **本地 markdown** — 议题是仓库里 `.scratch/` 下的文件
- **其他**（Jira、Linear 等） — 请用户用一段话描述流程；按自由文本记录

选择写入 `docs/agents/issue-tracker.md`。

**B — 分诊标签词汇。** 没装 `triage` 技能则整节跳过。

若已安装，只问一句：要不要保留默认分诊标签？（推荐：**要**）

默认，标签字符串等于名称：`needs-triage`、`needs-info`、`ready-for-agent`、`ready-for-human`、`wontfix`。选要就原样写。只有用户说不要，才收集覆盖。

**C — 领域文档。** 默认 **单一上下文** — 根上一个 `CONTEXT.md` + `docs/adr/`。几乎所有仓库都适用；不用问就写。

只有探索发现 monorepo 信号时，才提供 **多上下文** — 根 `CONTEXT-MAP.md` 指向各上下文的 `CONTEXT.md`。然后确认他们要哪种布局。

### 3. 确认并编辑

给用户看草稿：

- 将要添加或替换的 `## Agent skills` 块
- `docs/agents/issue-tracker.md`、`docs/agents/domain.md`、以及 `docs/agents/triage-labels.md`（仅当装了 `triage`）
- `.cursor/rules/fancy-skills.mdc`
- `docs/agents/setup-state.json`

让他们在写入前改。

### 4. 写入

**选哪个文件改 `## Agent skills`：**

- 有 `CLAUDE.md` 就改它
- 否则有 `AGENTS.md` 就改它
- 两个都没有，问用户建哪一个 — 不要替他们选

不要在已有 `CLAUDE.md` 时再创建 `AGENTS.md`（反过来也不要）— 始终改已经在的那份。

若已有 `## Agent skills` 块，**就地替换该节**。不要再追加一份。不要覆盖周围用户改过的内容。

块：

```markdown
## Agent skills

### Issue tracker

[一句话说明议题在哪]。见 `docs/agents/issue-tracker.md`。

### Triage labels

[一句话说明标签词汇]。见 `docs/agents/triage-labels.md`。

### Domain docs

[一句话说明布局 — 「单一上下文」或「多上下文」]。见 `docs/agents/domain.md`。

Cursor 通过 `.cursor/rules/fancy-skills.mdc` 读同一批文件。
```

仅当装了 `triage` 且跑过 B 节时，才包含 `### Triage labels` 子块并写 `docs/agents/triage-labels.md`。否则两处都省略。

然后用本技能目录里的种子模板写文档：

- [issue-tracker-github.md](./issue-tracker-github.md)
- [issue-tracker-gitlab.md](./issue-tracker-gitlab.md)
- [issue-tracker-local.md](./issue-tracker-local.md)
- [triage-labels.md](./triage-labels.md) — 仅当装了 `triage`
- [domain.md](./domain.md)

「其他」议题跟踪则按用户描述从零写 `docs/agents/issue-tracker.md`。

**Cursor 规则。** 用 [cursor-rule.mdc](./cursor-rule.mdc) 写 `.cursor/rules/fancy-skills.mdc`。需要则创建 `.cursor/rules/`。若根上已有 `.cursorrules`，不要动它 — `.mdc` 与它并存。永远不要新建根 `.cursorrules`。

**安装状态。** 写 `docs/agents/setup-state.json`：

```json
{
  "setup_completed": true,
  "setup_version": 1,
  "initialized_at": "<现在的 ISO-8601>",
  "issue_tracker": "github | gitlab | local | other",
  "domain_layout": "single-context | multi-context"
}
```

用实际选择字符串。除非跑过 B 节，否则不要把 `triage` 写进这个文件；若跑过，可加 `"triage_labels": "default"` 或 `"custom"`。

### 5. 完成

告诉用户初始化完成（或已再配置），以及写了哪些文件。说明以后可以直接改 `docs/agents/*.md` — 只有换跟踪器、改领域布局、或修补缺失的 `setup-state.json` 才需要再跑本技能。
