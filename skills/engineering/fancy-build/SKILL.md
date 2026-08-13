---
name: fancy-build
description: >-
  Write business code one task at a time from tasks.md, verify with a real
  command, then take the next task. Use when fancy-flow has a complete shape
  gate, or the user is implementing the current task list. Do not start if
  design.md / prototype / tasks.md / decisions.md are missing. Do not batch
  tasks. Do not use for writing the proposal.
---

# Fancy Build

Surgical implementation. One row from `tasks.md`, verify, then the next. You are not allowed to "just finish the module".

## Gate in

Refuse unless the **shape gate** is green: `design.md` (or no-UI waiver), **high-fidelity prototype** (or no-UI waiver), `tasks.md`, `decisions.md`. If not, return to `/fancy-flow` / `/fancy-shape`.

Do not edit `specs/` to make a check pass. If the contract is wrong, stop and send the user back to shape / harden. Restore `specs/` if you already changed it.

## Iron rules

1. **One task.** Take one open row. Do not batch. Do not "finish the feature". Do not drive-by refactor. Touch only files that row needs.
2. **Verify yourself.** Run that row's Verify command. Read the output. "I ran the tests" without a log is failure.
3. **Rotting context → stop.** Same bug twice, answers going sideways, diffs getting worse: say to start a new session. Do not keep patching in a dirty window.
4. **Don't guess a stuck bug.** Ask up to three clarifying questions, then name a root cause. Do not spray patches.

## Loop

1. **Check-in** (every new session): read `memory/PROGRESS.md` if it exists, `memory/FAILURES.md` if it exists, current `tasks.md` row, `decisions.md`, and `proposal.md`. Run `git log --oneline -10` if git exists. Name the next open task.
2. Take **one** open task. Restate its Done-when and Verify in one line before editing.
3. Implement against the prototype contract and `design.md`. Match `contract.ts` names and states. Do not expand mocks; on the existing-prototype branch, prefer replacing a mock the task names.
4. Verify, in order: the row's Verify command; lint/types if the repo has them; if UI, say what the user should see. Paste or save the log.
5. One commit for that task if git exists (Conventional Commits). Mark the row done. Append one line to `memory/PROGRESS.md` if Mini+ exists. Record a pit in `FAILURES.md` if you hit one.
6. Next row, or **check-out** if the user pauses: working tree clean, PROGRESS says what is left and what is next.

## Done when

No open tasks remain, or the user pauses after check-out. Tell `/fancy-flow`. Do not announce "the app is done" without `/fancy-harden`.
