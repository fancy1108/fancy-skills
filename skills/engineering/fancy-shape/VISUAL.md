# Visual (step 4)

UI products only. No UI → skip this file; record the no-UI waiver in `decisions.md`. Existing runnable prototype (step 5.5) → skip this file; reverse-extract `design.md` from that UI.

**Do not write `design.md` first. Do not write `demo.html` first.** Diagnose in chat, lock, then demo.

## 1. Three directions — stop the turn

From the proposal's one-sentence Pitch (not from a vibe adjective alone), offer **three** labeled directions **in the chat**. Each row:

- **Name**
- **1–2 named references** (real products, not "minimal" / "modern")
- **Color temperature** in `oklch()` (one background + one accent is enough)
- **Type pairing**
- **What it forbids**

Show them as A / B / C (or a table). You may mark one as recommended. Then **stop the turn.** Wait for a pick or a mix.

A vibe adjective is not a pick. Proposal **Visual Mood** is not a pick. "I'll go with a calm / clean look" invented by you is not a pick.

Forbidden in this same turn: `design.md`, `demo.html`, mockups-as-the-answer, any other UI file.

They can take the pick back later ("change the look"). Re-offer three directions. The demo becomes a draft.

## 2. `design.md`

Only after they pick (or mix). Keep it short. Must include:

- The chosen references
- Color tokens (`oklch()` — no hex in the contract)
- Type + spacing scale
- Screen map for the screens this product actually has (do not invent extra pages)
- At least **five visual bans** (card-itis, gray soup, rainbow gradients, dead empty states, …)

Write the file, recap the chosen references + tokens in chat, **stop the turn.** Do not write `demo.html` in this turn.

## 3. Enforce

Append 3–5 visual iron rules to `CLAUDE.md` (imperative: follow `design.md` before any UI edit; no hex; no new tokens without updating `design.md`).

## 4. Quick audit

After `design.md` exists, check it against the bans. If it violates them, fix the file before the demo. Do not invent an evaluator agent that is not in this collection.
