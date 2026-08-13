# Shape 初始化（第 3 步）

第一次不可逆动作。只建空壳 — 不要 schema、不要业务代码、不要填好的 `tasks.md`。

## 三层门槛 — 全绿才能 `git init`

1. Orient 握手：三问稳定，磁盘上有 `proposal.md`（Pitch、MVP、Non-Goals）。
2. 提案仍然完整：一句话 Pitch、一个 MVP、明确的 Non-Goals。任何一项发糊，回到 `/fancy-orient`。
3. 技术就绪，**用户确认**（不得编造）：
   - 技术栈一句话
   - 大概的启动命令
   - 这个仓库用哪个 Agent

缺任何一层 → 留在这里。

## 档次 — 先问，再建

`git init` 之前，把这张表（或 A / B / C）**写进对话**。然后可以标一个推荐。等他们选。只有他们**看过三个之后**随口一点，才默认 Mini。

禁止：「个人小工具，建议 Mini，确认？」——他们根本不知道还有 Micro、Pro。

| 档次 | 何时 | 建什么 |
| --- | --- | --- |
| **Micro** | 一次性脚本、无 UI、不需要跨会话记忆 | `git init` + 短 `CLAUDE.md`（或 Cursor 规则）≤ 60 行 |
| **Mini**（他们随便点就默认这个） | 个人产品、2–3 个能力 | 第 1–3 层：`CLAUDE.md`、`specs/core/proposal.md`、`memory/PROGRESS.md`、`.gitignore`、`.env.example` |
| **Pro** | 长期产品、很多会话 | Mini + `memory/{PROGRESS,FAILURES,ARCHITECTURE,DECISIONS,ROADMAP,TESTS}.md`（空壳）、空的 `.claude/` / `.cursor/` / `runs/`，若他们要则加 `docs/document-governance.md` |

技术栈、启动命令、持久化同一条：先给带标签的选项，再给推荐。不要拿「就用这个，确认？」锁定技术栈。

## 搬提案

- 单一产品（默认）：`proposal.md` → `specs/core/proposal.md`
- 点名功能：`specs/<feature>/proposal.md`

不要把提案全文贴进 `CLAUDE.md`。

| 提案里的 | 进 `CLAUDE.md`？ |
| --- | --- |
| Pitch（一行） | 是 |
| Vibe 约束，改成可执行禁令 | 是（3–7 条祈使句） |
| 启动命令 + 校验命令 | 是 |
| Check-in：新会话先读 `memory/PROGRESS.md`（Mini+）再 `git log --oneline -5` | 是 |
| Goals、Non-Goals、Visual Mood、Assumptions、Risks | 否 — 留在 `specs/` |

`CLAUDE.md` 里不要出现功能清单、DB schema、API 路由，或 `design.md` / `tasks.md` 正文。

## 文件落地之后

空壳第一次提交。然后做一次面向 Agent 的验收：用三行复述 Pitch + 铁律 + 启动命令。复述错了，先修 `CLAUDE.md` 再离开初始化。

## 文件冲突时的权威顺序

`specs/` > `CLAUDE.md` > `memory/` > `runs/`
