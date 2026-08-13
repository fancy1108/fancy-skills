---
name: fancy-orient
description: >-
  Find the problem, lock who / how painful / why now, and write proposal.md.
  Use when starting a new product, writing a proposal, vibe-coding step 1–2,
  or when fancy-flow needs the three questions answered. Do not create a git
  repo. Do not use for implementation or small bugfixes.
---

# Fancy Orient

Product truth before a repo. Hunt the problem if needed, lock the **three questions**, write `proposal.md`. **Never `git init`.**

If the user already has a clear idea and the pain is obvious, skip hunting. Go to the three questions.

Do not invent `/product-lens`, `/grill-me`, or `/to-prd`. Those are not in this collection yet. Do the grilling here.

## Three questions (gate)

The user answers these. You may propose; they confirm. Unstable or missing → stay in this skill. Do not start a repository. Do not write `design.md`, `tasks.md`, `decisions.md`, or a DB schema.

1. **Who** is this for?
2. **How painful** is it?
3. **Why now?**

All three stable → write (or update) `proposal.md`. That is the handshake.

## Hunt (only if there is no idea)

Don't search for "what idea is good". Search for "what is broken".

Pick one path:

- **Pain** — real complaints ("I hate that…", "why isn't there a tool that does A and B")
- **Gap** — competitor 1-star reviews and Feature Requests that sat for years
- **Edge** — a new model/API plus an old job

Output a short pain list, 3–5 competitors, and one sentence of direction. Then the three questions. If any question fails, hunt another round. Still no repo.

## Grill (before the file)

Ask 3–5 adversarial questions about MVP vs Non-Goals, who is *not* the user, and what would make this not worth building. Wait for answers. Do not write `proposal.md` while those are still mushy.

## Proposal

After the three questions are stable, write `proposal.md`:

- **No git repo:** current directory, or a path the user names (Obsidian is fine). Ask where if it is unclear.
- **Already a repo:** `specs/core/proposal.md` (or `specs/<feature>/proposal.md` if they name a feature).

Use the sections in [PROPOSAL.md](PROPOSAL.md). Fill Pitch, Problem, Tension, Goals (who + MVP), Non-Goals, Vibe, Assumptions. User Flows and Acceptance Criteria may be stubs. **No schema, no task breakdown.**

## Done when

- [ ] The user can say who / how painful / why now without hedging
- [ ] MVP is one capability, not a laundry list
- [ ] Non-Goals are explicit
- [ ] `proposal.md` is on disk
- [ ] No `git init` happened in this skill

Tell `/fancy-flow` (or the user) the handshake is done. Stop. Do not initialize a project — that is `/fancy-shape`.
