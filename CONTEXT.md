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

## Relationships

- An **Issue tracker** holds many **Issues**
- A **Promoted skill** is either **User-invoked** or **Model-invoked**
- `/fancy-init` writes **Setup state** in the consuming repo
