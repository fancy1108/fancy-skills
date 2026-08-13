# Fancy Skills

技能小、可改、可组合。流程由你掌控，技能可以随便改。

[English](README.md) · [简体中文](README.zh-CN.md)

第一版先交付锻造炉：安装方式、路由器，以及每个消费仓库跑一次的初始化。工作流技能之后再加入。

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

按需勾选技能，以及要装到哪些编程代理上。**请确保勾选了 `setup-fancy-skills`。**

### 2. 运行 `/setup-fancy-skills`

在代理里对每个消费仓库跑一次。它会：

- 询问你使用哪种议题跟踪（GitHub、GitLab 或本地文件）
- 询问领域文档放在哪里
- 写入 Cursor 规则，指向命令行代理所读的同一批文件
- 在 `docs/agents/setup-state.json` 记下完成状态，下次再跑是改配置，而不是再追加一段

### 3. 完成。

不确定该用哪条技能？运行 `/ask-fancy`。

## 技能一览

按谁能调用来分。**用户触发**的技能只有你亲手输入名称才能用。**模型触发**的技能你能调，模型在任务合适时也会自己调。用户触发的技能可以调用模型触发的技能，但不能再调用另一条用户触发的技能。

### 工程

**用户触发**

- **[ask-fancy](./skills/engineering/ask-fancy/SKILL.md)** — 询问当前该用哪条技能或哪条流程。本仓库的路由器。
- **[setup-fancy-skills](./skills/engineering/setup-fancy-skills/SKILL.md)** — 为本仓库配置 fancy-skills：议题跟踪、领域文档布局，以及 Cursor 规则。

**模型触发**

暂无。

### 效率

**用户触发**

暂无。

**模型触发**

暂无。

## 许可证

[MIT](./LICENSE)
