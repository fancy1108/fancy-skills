---
name: fancy-build
description: >-
  按 tasks.md 一次只写一条业务代码，用真实命令验证，再接下一条。fancy-flow 的 shape
  门已绿，或用户在执行当前任务清单时使用。design.md / 原型 / tasks.md / decisions.md
  缺失时不要开工。不要批量做任务。不要用于写提案。
---

# Fancy Build

外科手术式实现。从 `tasks.md` 取一行，验证，再取下一行。不许「把这个模块做完」。

## 进门

**shape 门**不绿就拒绝：`design.md`（或无 UI 豁免）、**高保真原型**（或无 UI 豁免）、`tasks.md`、`decisions.md`，**且用户接受了这些草稿**。否则回到 `/fancy-flow` / `/fancy-shape`。

不要改 `specs/` 来让检查通过。契约错了就停，把用户送回 shape / harden。若已经改了 `specs/`，先还原。

## 铁律

1. **一次一条。** 只领一个未完成行。不要批量。不要「把功能做完」。不要顺手重构。只动这一行需要的文件。
2. **自己验证。** 跑该行的验证命令。读输出。「我跑过测试了」却没有日志，算失败。
3. **上下文烂了就停。** 同一个 bug 两次、回答开始跑偏、diff 越改越乱：让用户新开会话。不要在脏窗口里继续补。
4. **卡住的 bug 不要猜。** 最多问三个澄清问题，再给出根因。不要乱打补丁。

## 循环

1. **Check-in**（每个新会话）：有则读 `memory/PROGRESS.md`、`memory/FAILURES.md`，以及当前 `tasks.md` 行、`decisions.md`、`proposal.md`。有 git 就跑 `git log --oneline -10`。说出下一条未完成任务。
2. 只领 **一条** 未完成任务。动手前用一行复述完成标准和验证。
3. 对照原型契约和 `design.md` 实现。状态和字段名对齐 `contract.ts`。不要扩张 mock；已有原型分支优先替换该任务点名的 mock。
4. 按序验证：该行的验证命令；仓库若有 lint/类型检查也跑；若是 UI，说出用户该看到什么。把日志贴出或存下。
5. 有 git 就为这一条单独提交（Conventional Commits）。把该行标完成。Mini+ 则在 `memory/PROGRESS.md` 追加一行。踩坑写入 `FAILURES.md`。
6. 下一条，或用户暂停时做 **check-out**：工作区干净，PROGRESS 写清还剩什么、下一步是什么。

## 完成标准

没有未完成任务，或用户在 check-out 后暂停。告诉 `/fancy-flow`。**停。** 不要在同一轮里开始 `/fancy-harden`。没有 `/fancy-harden` 就不要宣布「应用做完了」。
