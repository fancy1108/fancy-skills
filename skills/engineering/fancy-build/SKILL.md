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

## Loop

1. Session check-in: read `proposal.md`, current `tasks.md` row, `decisions.md`. If the context is already confused, stop and ask for a fresh session.
2. Take **one** open task. Do not batch.
3. Implement against the prototype contract and `design.md`. Do not expand mocks; on the existing-prototype branch, prefer replacing a mock the task names.
4. **Verify yourself:** run the verification command on that row. Read the output. "I ran the tests" without a log is failure.
5. Commit that task if the user wants git. Mark the row done.
6. Next row. If the window is rotting (same bug twice, answers going sideways), stop the loop and say to start a new session.

## Done when

No open tasks remain, or the user pauses. Tell `/fancy-flow`. Do not announce "the app is done" without `/fancy-harden`.
