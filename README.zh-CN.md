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

### 2. 可选：`/connect`

如果某个项目要共用这套集合的议题跟踪、领域文档和 Cursor 规则，在该仓库跑一次 `/connect`。以后再跑是更新已有文件，不会再追加一段。

### 3. 看看有什么

运行 `/catalog` 列出这套集合里的技能。

## 这套集合里有什么

按谁能调用来分。**用户触发**的技能只有你亲手输入名称才能用。**模型触发**的技能你能调，模型在任务合适时也会自己调。用户触发的技能可以调用模型触发的技能，但不能再调用另一条用户触发的技能。

### 工程

**用户触发**

- **[catalog](./skills/engineering/catalog/SKILL.md)** — 列出这套集合里有什么，以及该用哪条。
- **[connect](./skills/engineering/connect/SKILL.md)** — 把当前项目接到这套集合上：议题跟踪、领域文档、Cursor 规则。

**模型触发**

暂无。我在用的、或我觉得值得留下的技能会放在这里。

### 效率

**用户触发**

暂无。

**模型触发**

暂无。

## 许可证

[MIT](./LICENSE)
