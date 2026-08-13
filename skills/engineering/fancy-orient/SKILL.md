---
name: fancy-orient
description: >-
  Find the problem, research complaints and competitors, then lock who / how
  painful / why now and write proposal.md. Use when starting a new product,
  writing a proposal, vibe-coding step 1–2, or when fancy-flow needs the three
  questions answered. Do not create a git repo. Do not open with the three
  questions. Do not use for implementation or small bugfixes.
---

# Fancy Orient

Product truth before a repo. **Step 1 first: research, then evidence.** Step 2 is the proposal. **Never `git init`.** Never open by quizzing the three questions.

A product name is a **seed**, not a finished answer. Users cannot answer who / how painful / why now well until they have seen real complaints and competitors. Your job in step 1 is to go get that, put it in front of them, then help them converge.

Do not invent `/product-lens`, `/grill-me`, `/exa-search`, or `/to-prd`. Search and grill inside this skill.

## Sequence (do not reorder)

1. **Research (step 1)** — unless the skip rule below is true. Produce evidence. Show it. Wait for the user to react.
2. **Three questions (gate into step 2)** — ask only after they have seen the evidence. Anchor each question to that evidence so they can pick and correct, not invent from a blank page.
3. **Grill** — MVP vs Non-Goals, who is *not* the user.
4. **`proposal.md`** — write the file. Stop.

## Skip research? Almost never

Skip step 1 **only** if the user already stated all three answers **in their own words**, without hedging, in this conversation (or they paste a complete `proposal.md`).

Do **not** skip because they named a product or said they already know what they want. Name ≠ pain. If any of the three would still be a guess, research first.

## Research (step 1)

Don't search for "what idea is good". Search for "what is broken". Use web search. Quote real complaints (link + one line). No invented Reddit posts.

| They have | You do |
| --- | --- |
| **No idea** | Do **not** wait for a seed. One line: you can name a domain to narrow, otherwise hunting starts now. Pick one hunter path: **Pain** (real complaints), **Gap** (1-star reviews / Feature Requests that sat for years), or **Edge** (new model/API + old job). Search immediately. |
| **A seed** (a name or a category) | Hunt **that domain**. Existing apps' 1-star reviews, "I hate that…", "why isn't there a tool that does A and B". Do not wander into an unrelated field. |

Then show, in the draft environment (chat or a note they name — still no git repo):

- A **pain list** (5–10 items, quoted)
- **3–5 competitors** and what they fail at
- **One sentence of direction** (what a thinner / more vertical / more honest tool would be)

Optional: 2–3 short roleplay turns as the target user, using the quotes, so they can feel the pain.

Ask: "Which of these is *your* pain? What did I get wrong?" Then — and only then — the three questions.

If they bounce the direction, hunt another round. Still no repo.

Search query patterns: [HUNT.md](HUNT.md).

## Three questions (gate)

The user answers these. You may propose **from the evidence**; they confirm. Unstable or missing → more research or more talk. Do not start a repository. Do not write `design.md`, `tasks.md`, `decisions.md`, or a DB schema.

1. **Who** is this for?
2. **How painful** is it?
3. **Why now?**

Frame each with a fork taken from the research (which quoted pain, which incumbent they bounce off). Do not dump three empty prompts.

All three stable → grill, then write `proposal.md`. That is the handshake.

## Grill (before the file)

Ask 3–5 adversarial questions about MVP vs Non-Goals, who is *not* the user, and what would make this not worth building. Wait for answers. Do not write `proposal.md` while those are still mushy.

## Proposal

After the three questions are stable, write `proposal.md`:

- **No git repo:** current directory, or a path the user names (Obsidian is fine). Ask where if it is unclear.
- **Already a repo:** `specs/core/proposal.md` (or `specs/<feature>/proposal.md` if they name a feature).

Use the sections in [PROPOSAL.md](PROPOSAL.md). Fill Pitch, Problem, Tension, Goals (who + MVP), Non-Goals, Vibe, Assumptions. Quote the three answers in the user's words. User Flows and Acceptance Criteria may be stubs. **No schema, no task breakdown.**

## Done when

- [ ] Research (or the skip rule) happened **before** the three questions
- [ ] The user can say who / how painful / why now without hedging
- [ ] MVP is one capability, not a laundry list
- [ ] Non-Goals are explicit
- [ ] `proposal.md` is on disk
- [ ] No `git init` happened in this skill

Tell `/fancy-flow` (or the user) the handshake is done. Stop. Do not initialize a project — that is `/fancy-shape`.
