# Shape 产物

路径用 `specs/<feature>/`（单一产品时默认 `core`）。细节在这里；顺序以 SKILL.md 为准。

## 始终要有

| 文件 | 角色 |
| --- | --- |
| `specs/core/proposal.md` | 产品真相，初始化时搬入。不要在这里改写三问 |
| `specs/<feature>/decisions.md` | 选定架构、否决项、原型分支 |
| `specs/<feature>/tasks.md` | 原子工作，每行有验证 |

## 从零做 UI（第 5 步 — 不许跳）

顺序：**demo → 人看 → `contract.ts` → 测试契约草稿 → `gate_report.md`**。然后第 6 步。

| 文件 | 角色 |
| --- | --- |
| `runs/<task>/artifacts/demo.html`（或等价单文件） | **高保真原型** |
| `specs/<feature>/contract.ts` | 状态和数据名锁死 |
| `specs/<feature>/e2e_spec.js` 或 `unit_spec.ts` | 后面写代码时的考卷。有 UI → e2e 草稿。无 UI/纯逻辑 → 单元 spec。二选一，不必两份 |
| `runs/<task>/gate_report.md` | 结项：demo 能打开、调试态能切到、契约对齐 demo |

### Demo 约束

- 单文件：CSS 在 `<style>`，JS 在 `<script>`，图标 inline SVG。双击即开。不要打包器。
- 从 `design.md` 抽 token 到 `:root`。跟屏幕地图走。**禁止死按钮。** 禁止 `alert()`。
- `MockDB` + `localStorage`；写入时 200–500ms 延迟，好让 loading 存在。
- mock 数据要像真的，不要占位人名。
- 右下角小调试面板，能强制切到 `design.md` 里每一个 UI 状态（空、加载、错误，…）。

把 demo 亮出来。等。然后从 demo 抽出 `contract.ts`（状态、字段名、不变量）。再按提案 AC 写测试契约草稿（AC 还是草稿就先写回 `proposal.md`）。然后 `gate_report.md`。之后把 specs 当只读，留给 build。

## 已有高保真原型（第 5.5 步 — 不许跳）

留着 UI。不要再生成一份 `demo.html`。四步按序：

1. **组件清单** — 路径、用户可见能力、数据来源（mock / 硬编码 / 真）。没读过的文件不要猜。
2. **Mock 源** — 文件、假装了什么、该换成什么、哪个里程碑。列出禁止继续扩张的项。
3. **MVP vs P2** — 原型往往比 MVP 大。P2 可以留在界面上，但不写后端任务。
4. **Prototype → Task 映射** — 每个 MVP 行绑到后面的 task id。

若跳过了第 4 步，从 UI 反提 `design.md`。四张表写进 `tasks.md`（或 `specs/<feature>/prototype-map.md` 再从 tasks 引用）。

## 无 UI

在 `decisions.md` 写 `Prototype: none (no UI)`。跳过 `design.md` 和 demo。若有逻辑要锁，仍写一份单元测试契约草稿。

## `contract.ts`

锁死 UI 状态和数据名。后面不许字符串乱炖。包含：状态联合类型、实体字段、不变量、若有则含路由。名字从 demo 或现有 UI 来 — 不要另起一套词。

## `decisions.md`

每个决策：背景、**选定**、**否决及原因**。记录 `Prototype branch: from-scratch | existing | none`。有库表/API 才写那些表。

**先**展示调研（至少两个真实选项），再写文件。

## `tasks.md`

每行 ≤ 2 小时，可独立提交：

```markdown
- [ ] **Task-N: <名称>**
  - **做什么：** …
  - **完成标准：** …（提案里有 AC id 就绑上）
  - **验证：** 一条命令 **以及** 人眼能看见的一步（不要写「手工测试」）
  - **依赖：** Task-… 或无
```

已有原型分支：去 mock 的任务；不要加扩张 mock 的任务。验证一项不能省。

若后面阶段为了让测试过而改 `specs/`，把 `specs/` 还原，改产品代码。

任务写好后，Mini+：把 `memory/ARCHITECTURE.md` 写成「想做 X → 去这里」的地图，并在 `CLAUDE.md` 加 Context Routing（改 UI 先读 `design.md`，动数据先读 `contract.ts`，写代码先读 `tasks.md`）。
