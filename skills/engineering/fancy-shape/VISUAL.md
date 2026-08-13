# Visual (step 4)

UI products only. No UI → skip this file; record the no-UI waiver in `decisions.md`.

Two different specs — do not collapse them:

| File | What it is |
| --- | --- |
| `specs/<feature>/design.md` | **Design spec** (Clutch Design.md): tokens, type, spacing, brand references. `oklch()`, no hex |
| `specs/<feature>/visual.md` | **This product's UI contract**: which look was picked, screen map, UI states, at least five visual bans |

**Do not write `visual.md` or `demo.html` until the matching case has a pick or a file.** Diagnose in chat first.

## Diagnose — stop the turn

After init, ask **exactly**:

**How should we lock the look?**

1. **Vague** — I don't know the style. Recommend three from Clutch Design presets.
2. **Style is set** — I'll give `design.md`, screenshots, or a reference URL.
3. **I already have a prototype** — I'll give the path (or drop the files).

A vibe adjective is not a case. Proposal Visual Mood is not a case. Infer only if they already attached a prototype, a `design.md`, or said they have no idea.

## Case 1 — vague style

Catalog: [PRESETS.md](PRESETS.md) (snapshot of Clutch Design mode's 70+ brand looks). If a Clutch repo is on disk, after they pick an id, read `services/orchestrator/src/design/presets/<id>.md` or `.spec.json` for tokens.

Pick **three** presets that fit this Pitch. They must disagree. Fill this table — **Looks like** is the preset name (Linear, Apple, Notion, …), not "minimal". Do not paste the whole catalog.

| | Name | Looks like (preset) | Color (`oklch()`) | Type | Forbids |
| --- | --- | --- | --- | --- | --- |
| **A** | … | Clutch preset | bg + accent | pairing | … |
| **B** | … | Clutch preset | bg + accent | pairing | … |
| **C** | … | Clutch preset | bg + accent | pairing | … |

**Stop.** Ask: **Which look should the demo follow — A, B, C, or a mix?** Then write `design.md` (tokens from that preset) **and** `visual.md` (screen map + bans). Recap. **Stop again.** No demo in those turns.

## Case 2 — style is set, need mockups

**Stop.** Ask them to provide at least one: `design.md` / `DESIGN.md`, screenshots, Figma, or a URL.

Wait. Then put the design spec at `specs/<feature>/design.md` (copy or extract tokens in `oklch()`). If this harness has `impeccable` (extract), invoke it. If not, extract inside this skill. Then write `visual.md` (screen map + bans) from the Pitch — do not dump screens into `design.md`. Recap. **Stop.** Then mockup (step 5). No demo in the extract turn.

## Case 3 — they already have a prototype

**Stop.** Ask for the path or the files. Do not generate `demo.html`. Go to step 5.5 in [ARTIFACTS.md](ARTIFACTS.md). Reverse-extract `design.md` (tokens) and `visual.md` (screens + bans) from that UI if needed.

## After both files (cases 1–2)

Append 3–5 iron rules to `CLAUDE.md`: follow `design.md` for tokens (no hex); follow `visual.md` before any UI layout.

`design.md` must include: chosen references / preset id, `oklch()` tokens, type + spacing. No screen map.

`visual.md` must include: which look (A/B/C or source), screen map for screens this product actually has, UI states (empty, loading, error, …), at least five visual bans (card-itis, gray soup, rainbow gradients, dead empty states, …).

Check `visual.md` bans against `design.md` tokens; fix before the demo.

## After the first demo

The first demo is not the contract. Show the path. **Stop.** Ask: open it — what should change? Cheap / too AI / no breath → polish (below), then ask again. Do not write `contract.ts` until they accept.

## Polish (optional, as many rounds as they want)

If they want it better: if this harness has `taste` or `impeccable` (audit / polish / craft), **invoke them** on the demo. If not, critique inside this skill: color (clear, not gray soup), spacing (breath), type weight contrast, cheap-AI tells — then apply CSS numbers. Ask again.

Those helpers are **not** shipped in fancy-skills. Do not pretend `/taste` exists if it is not installed. Do the work here instead.

They can rewind: change case, change A/B/C, or bring a prototype later.
