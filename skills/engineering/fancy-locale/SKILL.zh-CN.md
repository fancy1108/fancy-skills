---
name: fancy-locale
description: 把本集合的技能说明在英文（默认）和简体中文之间切换。
disable-model-invocation: true
---

# Fancy Locale

各运行时读的是 `SKILL.md`。本仓库默认英文写在 `SKILL.md`，简体中文写在 `SKILL.zh-CN.md`。本技能把选定语言覆盖到**已安装副本**里的 `SKILL.md`（`.claude/skills`、`.agents/skills`、`.cursor/skills`）。

## 默认

英文。用户要英文就什么都不用做。

## 流程

1. 问一次：English（默认）还是简体中文？
2. 运行本技能目录下的脚本：

```bash
bash "<本技能目录>/scripts/set-locale.sh" en
# 或
bash "<本技能目录>/scripts/set-locale.sh" zh-CN
```

把 `<本技能目录>` 解析成装着这份 `SKILL.md` 的已安装路径。

3. 请用户**新开一条对话**。当前会话可能还握着旧的 `SKILL.md`。

不要改 fancy-skills 仓库 `skills/` 源文件。不要发明第三种语言。
