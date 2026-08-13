# Fancy Skills

这是我自己的 Agent Skills 仓库。收录我日常在用的技能，也会放进我觉得值得留下的技能。技能小、可改、可组合，之后会继续往里加。

[English](README.md) · [简体中文](README.zh-CN.md)

## 安装

两种进入方式。**只选一种**——两种都装，每条技能会出现两份。

Claude Code 插件是托管的整包。[skills.sh](https://skills.sh/fancy1108/fancy-skills) 会把可编辑的技能文件拷进你的项目。

### 1. 获取技能

**Claude Code**

本仓库不在 Claude Code 官方市场里。先把本仓库加为市场，再安装插件。Claude 读的是目录文件 `.claude-plugin/marketplace.json`，不是 `plugin.json`。

```bash
claude plugin marketplace add fancy1108/fancy-skills
claude plugin install fancy-skills@fancy
```

或在会话里：

```
/plugin marketplace add fancy1108/fancy-skills
/plugin install fancy-skills@fancy
```

兜底——若 GitHub 克隆或接口失败，指向 **marketplace.json** 的 Raw 地址（不要指向 `plugin.json`）：

```bash
claude plugin marketplace add https://raw.githubusercontent.com/fancy1108/fancy-skills/main/.claude-plugin/marketplace.json
claude plugin install fancy-skills@fancy
```

**Codex、Cursor 及其他代理**

```bash
npx skills@latest add fancy1108/fancy-skills
```

按需勾选技能，以及要装到哪些编程代理上。

### 2. 可选：`/fancy-init`

如果某个项目要按 Fancy 的规范初始化（议题跟踪、领域文档、Cursor 规则），在该工作区跑一次 `/fancy-init`。以后再跑是更新已有文件，不会再追加一段。

### 3. 看看有什么

运行 `/fancy-discover` 探索这套集合里的技能。

要开始做一个产品（不是随口问一句），直接说就行——`/fancy-flow` 是**模型触发**的，会接手流水线。查正则、改一个小 bug 不会被它抢走。

## 这套集合里有什么

按谁能调用来分。**用户触发**的技能只有你亲手输入名称才能用。**模型触发**的技能你能调，模型在任务合适时也会自己调。用户触发的技能可以调用模型触发的技能，但不能再调用另一条用户触发的技能。

### 工程

**用户触发**

- **[fancy-discover](./skills/engineering/fancy-discover/SKILL.md)** — 探索本仓库里有哪些技能，以及该用哪条。
- **[fancy-init](./skills/engineering/fancy-init/SKILL.md)** — 按 Fancy 的规范初始化当前工作区：议题跟踪、领域文档、Cursor 规则。

**模型触发**

- **[fancy-flow](./skills/engineering/fancy-flow/SKILL.md)** — 按意图接手的产品流水线。新产品、vibe coding、或在产品仓库里说继续时才唤醒；日常问答不会进流水线。
- **[fancy-orient](./skills/engineering/fancy-orient/SKILL.md)** — 锁定谁用、多痛、为什么现在做，然后写 proposal.md。不建 git 仓库。

### 效率

**用户触发**

暂无。

**模型触发**

暂无。

## 许可证

[MIT](./LICENSE)
