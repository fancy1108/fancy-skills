# Visual (step 4)

UI products only. No UI → skip this file; record the no-UI waiver in `decisions.md`.

**Do not write `design.md` first.** Diagnose, then lock.

## 1. Three directions

From the proposal's vibe words, offer **three** visual directions. Each has: a name, 1–2 named references, a color temperature in `oklch()`, a type pairing, and what it forbids.

Wait for the user to pick (or mix). A vibe adjective is not a pick.

## 2. `design.md`

Keep it short. Must include:

- The chosen references
- Color tokens (`oklch()` — no hex in the contract)
- Type + spacing scale
- Screen map for the screens this product actually has (do not invent extra pages)
- At least **five visual bans** (card-itis, gray soup, rainbow gradients, dead empty states, …)

## 3. Enforce

Append 3–5 visual iron rules to `CLAUDE.md` (imperative: follow `design.md` before any UI edit; no hex; no new tokens without updating `design.md`).

## 4. Quick audit

After `design.md` exists, check it against the bans. If it violates them, fix the file before the demo. Do not invent an evaluator agent that is not in this collection.
