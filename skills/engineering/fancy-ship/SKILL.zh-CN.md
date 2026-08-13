---
name: fancy-ship
description: >-
  发布产品并更新 memory：生产配置、回滚点、PROGRESS.md，以及下一轮从哪一步开始。fancy-flow
  已硬化，或用户要求部署、结束本轮时使用。不要带着 mock 数据上线。不要在提案阶段使用。
---

# Fancy Ship

把环收住。这是生产，不是 demo。然后写下下一次会话需要的东西。

## 进门

`/fancy-harden` 应当留下了证据。主路径没跑过就回去。不要发布仍靠 mock 跑的 UI。

玩具或仅本地工具可以标成 **仅本地**。写清楚怎么运行、没有 URL。仍然要更新 memory。

## 发布

先把这份清单亮出来。**停。** 问：上线、仅本地、还是先不发？他们选了再发布。

- [ ] 生产环境变量（不是本地占位符）— 或一份明确的仅本地说明
- [ ] 迁移在不只是这台笔记本的地方验证过（没有数据库就跳过）
- [ ] 日志里去掉秘密
- [ ] 若产品对外，要有错误监控
- [ ] 记录回滚提交哈希（`git rev-parse HEAD`）
- [ ] 在 `memory/PROGRESS.md` 标记部署（Mini/Pro 布局则创建该文件）

## 迭代（十分钟）

只更新已经存在的文件；不要在 Micro 仓库里发明六件套。

1. `memory/PROGRESS.md` — 停在哪
2. `memory/FAILURES.md` — 真实世界里失败了什么
3. 耐久的架构决定 → `specs/.../decisions.md`；临时取舍 → `memory/DECISIONS.md`
4. 下一轮优先级来自使用，不是剩下的点子清单
5. `CLAUDE.md` 只保留路由和铁律

**写下下一轮从哪开始**（写进 PROGRESS）。流水线中途也可以回退到更早的锁 — 见 `/fancy-flow` 回退表，不只是发布之后：

| 变更 | 下一阶段 |
| --- | --- |
| 交互不对 | `/fancy-shape`（视觉 / 原型） |
| 小改 / bug | `/fancy-build` |
| 架构 | `/fancy-shape` 的拆解（`decisions.md` / `tasks.md`） |
| 方向错了 | `/fancy-orient` |

## 完成标准

有已发布的 URL，或一份明确的仅本地说明；回滚哈希已记录；仓库在用的 memory 已更新；下一阶段已点名。告诉 `/fancy-flow` 流水线空闲。
