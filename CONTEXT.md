# Fancy Skills

A collection of agent skills loaded by Claude Code, Cursor, Codex, and other Agent Skills-compatible harnesses. Skills are organized into buckets. A consuming repo can be initialized with `/fancy-init`.

## Language

**Issue tracker**:
The tool that hosts a repo's issues — GitHub Issues, GitLab Issues, a local `.scratch/` markdown convention, or similar. Engineering skills that create or move work read from and write to it.
_Avoid_: backlog manager, backlog backend, issue host

**Issue**:
A single tracked unit of work inside an **Issue tracker** — a bug, task, spec, or slice.
_Avoid_: ticket (use only when quoting an external system that calls them tickets)

**Promoted skill**:
A skill in `skills/engineering/` or `skills/productivity/`. Promoted skills appear in `README.md`, `README.zh-CN.md`, `.claude-plugin/plugin.json`, and the generated inventory inside `/fancy-discover`. Skills in `misc/`, `in-progress/`, and `deprecated/` are not promoted.

**User-invoked skill**:
A skill reachable only when a human types its name. Frontmatter sets `disable-model-invocation: true`; Codex sets `policy.allow_implicit_invocation: false`. Other skills must not invoke it.

**Model-invoked skill**:
A skill the model may reach for on its own, and that other skills may invoke in prose (`Run the `/name` skill`). Omit `disable-model-invocation`.

**Setup state**:
The file `docs/agents/setup-state.json` in a consuming repo. It is the canonical record that `/fancy-init` has finished (or is being reconfigured). Do not use HTML comments in `CLAUDE.md` / `AGENTS.md` as a substitute.

**Three questions**:
Who is this for? How painful is it? Why now? The user answers; the agent must not invent them. Unstable answers block a git repo.

**Handshake**:
`/fancy-orient` is done when the **Three questions** are stable and `proposal.md` is on disk. Research (quotes, competitors, a direction) happens **before** those questions unless the user already answered all three in their own words. A product name is not a skip. No `git init` in that skill.

**High-fidelity prototype**:
The interactive contract produced (or audited) by `/fancy-shape`. From scratch: a clickable demo. Existing UI: that UI is the prototype. No UI: an explicit waiver in `decisions.md`. Same rank as `design.md` and `tasks.md`.

**Shape gate**:
`/fancy-shape` is done when `design.md` (or no-UI waiver), the **High-fidelity prototype** (or no-UI waiver), `tasks.md`, and `decisions.md` exist. From-scratch UI also needs `contract.ts`, a test-contract draft, and `gate_report.md`. Blocks `/fancy-build`. Visual directions come **before** `design.md`.

**Pipeline**:
`/fancy-flow` is the intent-triggered assembler. It dispatches `/fancy-orient` → `/fancy-shape` → `/fancy-build` → `/fancy-harden` → `/fancy-ship`. It must not run on one-shot questions.

**Locale**:
Installed skill bodies. Default **English** (`SKILL.md`). Simplified Chinese lives in `SKILL.zh-CN.md` until `/fancy-locale` copies it onto the installed `SKILL.md`.

**In-progress**:
A skill or backlog row under `skills/in-progress/`. Public, not promoted. `/fancy-discover` must not list it. A stub must refuse to run.

## Relationships

- An **Issue tracker** holds many **Issues**
- A **Promoted skill** is either **User-invoked** or **Model-invoked**
- `/fancy-init` writes **Setup state** in the consuming repo
- `/fancy-flow` runs stage skills in order until the current **gate** is done
- `/fancy-shape` produces the **High-fidelity prototype** as part of the **Shape gate**
- An **In-progress** row is not a **Promoted skill**
- `/fancy-locale` switches **Locale** on installed copies only
