---
name: fancy-discover
description: 探索本集合里有哪些技能，以及该用哪条。
disable-model-invocation: true
---

# Fancy Discover

这是 Fancy 的个人技能集合 — 日常在用的，加上值得留下的。有新的挣到位置再往里加。

## 这里有什么

给消费仓库用的事务：

- **`/fancy-init`** — 按 Fancy 的规范初始化当前工作区（议题跟踪、领域文档、Cursor 规则）。幂等：`docs/agents/setup-state.json` 记录完成，再跑是更新而不是再追加一段。
- **`/fancy-locale`** — 技能说明默认英文；可切换为简体中文。切换后请新开对话。

产品流水线（按意图触发 — 你要做产品或说继续时 Agent 才接手，日常问答不会进）：

- **`/fancy-flow`** — 编排器。判断下一阶段并跑它。
- **`/fancy-orient`** — 先调研抱怨，再三问，再 `proposal.md`。永不 `git init`。不要一上来就问三问。
- **`/fancy-shape`** — 建仓、三个视觉方向、**高保真原型**、`design.md`、`decisions.md`、`tasks.md`。不写业务代码。
- **`/fancy-build`** — 从 `tasks.md` 取一条，验证，再下一条。
- **`/fancy-harden`** — 有证据的测试 + 真相对齐。
- **`/fancy-ship`** — 发布和 memory。

进行中的占位（视频流水线、策展名单）**不**在下面的清单里。用户要那些，就说还没发布。

本集合其余都是 Fancy 在用或决定留下的技能。用户要的若不在下面，就说集合里还没有 — 不要发明一条缺失的技能。

<!-- BEGIN GENERATED INVENTORY -->
## 已收录技能

本列表由 `.claude-plugin/plugin.json` 生成。不要手改。

**用户触发**

- **`/fancy-discover`** — 探索本集合里有哪些技能，以及该用哪条。
- **`/fancy-init`** — 按 Fancy 的规范初始化当前工作区 — 议题跟踪、领域文档、Cursor 规则。
- **`/fancy-locale`** — 把本集合的技能说明在英文（默认）和简体中文之间切换。

**模型触发**

- **`/fancy-build`** — 按 tasks.md 一次只写一条业务代码，用真实命令验证，再接下一条。fancy-flow 的 shape 门已绿，或用户在执行当前任务清单时使用。design.md / 原型 / tasks.md / decisions.md 缺失时不要开工。不要批量做任务。不要用于写提案。
- **`/fancy-flow`** — 开始或继续一条产品 / vibe coding 流水线。用户要做新产品、做一个应用或工具、走 vibe coding，或在产品仓库里明确说继续时使用。不要用于查正则、看 traceback，或在已有产品里改一个文件的小 bug。
- **`/fancy-harden`** — 用物理证据证明产品，再对齐漂移：实现、理解或定义。fancy-flow 已做完任务、用户要求测试，或验收感觉不对时使用。不要接受口头「测试通过」。不要在还写提案时使用。
- **`/fancy-orient`** — 找问题，调研抱怨和竞品，再锁定谁用 / 多痛 / 为什么现在做，并写下 proposal.md。新产品、写提案、vibe coding 第 1–2 步，或 fancy-flow 需要三问有答案时使用。不要建 git 仓库。不要一上来就问三问。不要用于实现或小 bug。
- **`/fancy-shape`** — 写代码前的准备：建仓、锁定视觉契约、产出高保真原型，再写 decisions.md 和 tasks.md。fancy-flow 已有稳定提案、用户在塑造产品，或他们提到 design.md、原型、demo.html、拆任务时使用。不要写业务代码。不要跳过视觉方向和可点 demo。不要用于小 bug。
- **`/fancy-ship`** — 发布产品并更新 memory：生产配置、回滚点、PROGRESS.md，以及下一轮从哪一步开始。fancy-flow 已硬化，或用户要求部署、结束本轮时使用。不要带着 mock 数据上线。不要在提案阶段使用。
<!-- END GENERATED INVENTORY -->

## 怎么选

| 情况 | 用哪条 |
| --- | --- |
| 新产品、vibe coding、或继续这个产品 | `/fancy-flow` |
| 只要三问 / 提案 | `/fancy-orient` |
| 建仓、原型、设计、任务 | `/fancy-shape` |
| 执行当前任务清单 | `/fancy-build` |
| 测试 / 验收感觉不对 | `/fancy-harden` |
| 部署 / 结束本轮 | `/fancy-ship` |
| 本项目没有 `docs/agents/setup-state.json`，而某条技能需要跟踪器或词汇表 | `/fancy-init` |
| 要把技能说明换成中文或换回英文 | `/fancy-locale` |
| 「这集合里有什么？」 | 你已经在这里 |
| 清单上没有的技能 | 说这里还没有 |
