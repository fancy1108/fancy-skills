---
name: fancy-shape
description: >-
  写代码前的准备：建仓、锁定视觉契约、产出高保真原型，再写 decisions.md 和 tasks.md。fancy-flow
  已有稳定提案、用户在塑造产品，或他们提到 design.md、原型、demo.html、拆任务时使用。不要写业务代码。不要跳过视觉方向和可点
  demo。不要用于小 bug。
---

# Fancy Shape

从「知道要做什么」到「可以写业务代码」之间的全部准备。建仓、锁定样子和行为，再拆工作。

**这里不要写产品功能。** 不要把 mock 换成真后端。不要扩张 mock。本集合没有的辅助技能不要假装存在 — 在这里做完。

**不要一上来**就定技术栈、写 `design.md`、或拆 `tasks.md`。和 orient 同一条：先给选项和证据，再锁定。

## 进门

`/fancy-orient` 没完成就拒绝：要有 `proposal.md`，三问要稳。否则让 `/fancy-flow` 去跑 `/fancy-orient`。

初始化在这之上还有**第三层**（技术栈 + 启动命令 + 用哪个 Agent）。缺任何一项就留在初始化。不要靠猜去 `git init`。

## 出门（写代码门槛）

全部勾上，然后停，回到 `/fancy-flow`：

- [ ] `specs/<feature>/design.md` — 或 `decisions.md` 里明确的**无 UI**豁免
- [ ] **高保真原型** — 交互契约（见分支）。不是截图，不是只有视觉稿的导出
- [ ] 从零做 UI：`contract.ts` + 测试契约草稿（`e2e_spec.js` 或单元 spec）+ `gate_report.md`
- [ ] 已有 UI：组件清单、mock 源清单、MVP vs P2 表、Prototype → Task 映射
- [ ] `specs/<feature>/decisions.md`
- [ ] `specs/<feature>/tasks.md`（原子、≤ 2h、每行有验证）

这扇门没绿，`/fancy-build` 不得开工。

## 高保真原型（必做）

这是**核心契约**，和 `design.md`、`tasks.md` 同级。后面的代码必须对齐它，而不是反过来。

| 分支 | 何时 | 什么算原型 |
| --- | --- | --- |
| **从零** | 需要 UI，还没有可跑的 UI | 可点的产物（优先 `runs/<task>/artifacts/demo.html` 或等价单文件 demo），mock 数据要像真的 |
| **已有原型** | 用户已经给了带 mock 的可跑高保真 UI | **留着那份 UI。** 不要再生成一份 `demo.html`。做审计 |
| **无 UI** | 后端 / CLI / 没有界面 | 跳过视觉和原型。在 `decisions.md` 写 `Prototype: none (no UI)`。不需要 `design.md` |

按用户手里实际有的选分支。不要又跑 4+5 又跑 5.5。

他们点名更早的锁（提案不对、改 demo、任务重拆），就回退 — 不要继续往下走这段顺序。回退表在 `/fancy-flow`。

## 顺序（不许打乱）

1. **初始化（第 3 步）** — [INIT.md](INIT.md)。把 Micro / Mini / Pro 做成带标签的选项（表或 A/B/C）贴进对话，然后可以标一个推荐。只有他们看过三个之后随口一点，才默认 Mini。技术栈、启动命令、Agent 同一写法。然后 `git init`，搬 `proposal.md`，短 `CLAUDE.md`，第一次提交。只建空壳。
2. **视觉（第 4 步，仅 UI）** — [VISUAL.md](VISUAL.md)。给 **三个视觉方向**，等他们选，再写 `design.md`。视觉禁令写进 `CLAUDE.md`。没选之前不要写 `design.md`。
3. **契约（第 5 或 5.5 步）** — [ARTIFACTS.md](ARTIFACTS.md)。从零：demo → **停，人看，改到他们接受** → `contract.ts` → 测试契约草稿 → `gate_report.md`。已有：四步审计，不重写 UI，等他们接受那些表。无 UI：跳到拆解。
4. **拆解（第 6 步）** — 先给一轮库/方案调研（至少两个选项，选定 vs 否决）。然后 `decisions.md`，Mini+ 再写 `memory/ARCHITECTURE.md`，然后 `tasks.md`。**停。** 问这样拆对不对。已有原型分支的任务必须含去 mock；不要加扩张 mock 的任务。

用户不懂技术时，用大白话讲栈和任务清单。**所有人**都要等人点头门才绿 — 不是只有非技术用户。

## 完成标准

出门清单全绿，**且**他们接受了原型和 `tasks.md`。告诉 `/fancy-flow` shape 完成。不要在同一轮里开始 `/fancy-build`。
