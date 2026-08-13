---
name: fancy-build
description: >-
  Write business code one task at a time from tasks.md, verify with a real
  command, then take the next task. Use when fancy-flow has a complete shape
  gate, or the user is implementing the current task list. Do not start if
  design.md / prototype / tasks.md / decisions.md are missing. Do not use for
  writing the proposal.
---

# Fancy Build

Surgical implementation. One row from `tasks.md`, verify, then the next. You are not allowed to "just finish the module".

## Gate in

Refuse unless the **shape gate** is green: `design.md` (or no-UI waiver), **high-fidelity prototype** (or no-UI waiver), `tasks.md`, `decisions.md`. If not, return to `/fancy-flow` / `/fancy-shape`.

Do not edit `specs/` to make a check pass. If the contract is wrong, stop and send the user back to shape / harden. Restore `specs/` if you already changed it.

## Iron rules

1. **One task.** Take one open row. Do not batch. Do not "finish the feature".
2. **Verify yourself.** Run that row's Verify command. Read the output. "I ran the tests" without a log is failure.
3. **Rotting context → stop.** Same bug twice, answers going sideways, diffs getting worse: say to start a new session. Do not keep patching in a dirty window.

## Loop

1. **Check-in** (every new session): read `memory/PROGRESS.md` if it exists, `memory/FAILURES.md` if it exists, current `tasks.md` row, `decisions.md`, and `proposal.md`. Run `git log --oneline -10` if git exists. Name the next open task.
2. Take **one** open task.
3. Implement against the prototype contract and `design.md`. Match `contract.ts` names and states. Do not expand mocks; on the existing-prototype branch, prefer replacing a mock the task names.
4. Run the verification on that row. Paste or save the log.
5. Commit that task if the user wants git. Mark the row done. Append one line to `memory/PROGRESS.md` if Mini+ exists.
6. Next row, or stop if the user pauses.

## Done when

No open tasks remain, or the user pauses. Tell `/fancy-flow`. Do not announce "the app is done" without `/fancy-harden`.
