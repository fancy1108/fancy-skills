# 安装说明（中文）的唯一来源

一套安装说法，一种措辞。[README.zh-CN.md](../README.zh-CN.md) 必须用这里的命令块，不要另写一套。先改这里，再拷进中文 README。

英文安装块见 [install-block.md](./install-block.md)。

两条路径互斥。Claude Code 插件是托管整包。skills.sh 把可编辑的技能文件拷进项目。两种都装，每条技能会出现两份——务必写「只选一种」。

## Claude Code — 插件

本仓库**不在** Claude Code 官方市场里。先把本仓库加为市场，再安装插件。Claude 读的是 `.claude-plugin/marketplace.json`（目录），不是 `plugin.json`。

首选 — GitHub 简写：

```bash
claude plugin marketplace add fancy1108/fancy-skills
claude plugin install fancy-skills@fancy
```

或在会话里：

```
/plugin marketplace add fancy1108/fancy-skills
/plugin install fancy-skills@fancy
```

兜底 — 若 GitHub 克隆或接口失败，指向 **marketplace.json** 的 Raw 地址（不要指向 `plugin.json`）：

```bash
claude plugin marketplace add https://raw.githubusercontent.com/fancy1108/fancy-skills/main/.claude-plugin/marketplace.json
claude plugin install fancy-skills@fancy
```

## Codex、Cursor 及其他代理 — skills.sh

```bash
npx skills@latest add fancy1108/fancy-skills
```

按需勾选技能，以及要装到哪些编程代理上。**请确保勾选了 `setup-fancy-skills`。**

单条技能：

```bash
npx skills@latest add fancy1108/fancy-skills --skill=setup-fancy-skills
```

```bash
npx skills@latest update setup-fancy-skills
```
