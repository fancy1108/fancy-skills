# 视觉（第 4 步）

仅 UI 产品。无 UI → 跳过本文件；在 `decisions.md` 写无 UI 豁免。

两份规范，不要并成一份：

| 文件 | 是什么 |
| --- | --- |
| `specs/<feature>/design.md` | **设计规范**（Clutch 的 Design.md）：token、字体、间距、品牌参照。`oklch()`，不要 hex |
| `specs/<feature>/visual.md` | **本产品的界面契约**：选了哪套样子、屏幕地图、UI 状态、至少五条视觉禁令 |

**对应情况还没选定、文件也还没给之前，不要写 `visual.md` 或 `demo.html`。** 先在对话里诊疗。

## 诊疗 — 停这一轮

初始化之后，必须问：

**样子怎么锁？**

1. **还模糊** — 不知道定什么风格。从 Clutch Design 预设里推荐三个。
2. **风格已定** — 我会给 `design.md`、截图或参考 URL。
3. **已经有原型** — 我给路径（或把文件丢进来）。

一个 vibe 形容词不算情况。提案里的 Visual Mood 不算情况。只有他们已经附了原型、`design.md`、或明确说没想法时，才能直接归类。

## 情况 1 — 风格模糊

目录：[PRESETS.md](PRESETS.md)（Clutch Design 模式 70+ 品牌样子的快照）。磁盘上有 Clutch 仓库时，他们选定 id 之后读 `services/orchestrator/src/design/presets/<id>.md` 或 `.spec.json` 拿 token。

按本产品 Pitch 选出 **三个**预设。必须互相不同意。填这张表 — **长得像**写预设名（Linear、Apple、Notion，…），不要写「极简」。不要把整本目录贴进对话。

| | 名称 | 长得像（预设） | 颜色（`oklch()`） | 字体 | 禁止 |
| --- | --- | --- | --- | --- | --- |
| **A** | … | Clutch 预设 | 背景 + 强调 | 搭配 | … |
| **B** | … | Clutch 预设 | 背景 + 强调 | 搭配 | … |
| **C** | … | Clutch 预设 | 背景 + 强调 | 搭配 | … |

**停。** 问：**demo 跟哪套走 — A、B、C，还是混？** 然后写 `design.md`（该预设的 token）**和** `visual.md`（屏幕地图 + 禁令）。复述。**再停。** 那两轮不要做 demo。

## 情况 2 — 风格已定，要核心页 Mockup

**停。** 请他们至少给一样：`design.md` / `DESIGN.md`、截图、Figma、或 URL。

等。把设计规范落到 `specs/<feature>/design.md`（拷贝，或抽成 `oklch()` token）。本环境有 `impeccable`（extract）就调用。没有就在本技能里抽。然后写 `visual.md`（屏幕地图 + 禁令），从 Pitch 来 — 不要把屏幕塞进 `design.md`。复述。**停。** 再做 Mockup（第 5 步）。抽取那一轮不要写 demo。

## 情况 3 — 已经有原型

**停。** 要路径或文件。不要再生成 `demo.html`。转到 [ARTIFACTS.md](ARTIFACTS.md) 第 5.5 步。需要的话从那份 UI 反提 `design.md`（token）和 `visual.md`（屏幕 + 禁令）。

## 两份文件都有了之后（情况 1–2）

把 3–5 条铁律追加进 `CLAUDE.md`：token 跟 `design.md`（禁止 hex）；改布局前先读 `visual.md`。

`design.md` 必须有：选定的参照 / 预设 id、`oklch()` token、字体 + 间距。不要屏幕地图。

`visual.md` 必须有：选了哪套（A/B/C 或来源）、本产品实际有的屏幕地图、UI 状态（空、加载、错误，…）、至少五条视觉禁令（卡片病、灰汤、彩虹渐变、死掉的空状态，…）。

用 `visual.md` 的禁令对照 `design.md` 的 token；违规则先改再做 demo。

## 第一份 demo 之后

第一份 demo 还不是契约。亮出路径。**停。** 问：打开它 — 要改什么？廉价 / 太 AI / 没呼吸 → 先打磨（下面），再问一遍。他们接受之前不要写 `contract.ts`。

## 打磨（可选，他们要几轮就几轮）

他们想更好：本环境有 `taste` 或 `impeccable`（audit / polish / craft），就**对着 demo 调用**。没有就在本技能里批判：颜色（通透、不是灰汤）、间距（呼吸）、字重对比、AI 廉价感 — 然后改 CSS 数值。再问。

这些辅助技能 **不是** fancy-skills 随包的。环境里没装就不要假装有 `/taste`。改在这里做完。

可以回退：换情况、换 A/B/C、或后来再给一份原型。
