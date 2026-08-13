# Shape artifacts

Paths use `specs/<feature>/` (default `core` when there is one product). Details live here; the SKILL.md sequence is the order.

## Always

| File | Role |
| --- | --- |
| `specs/core/proposal.md` | Product truth, moved in at init. Do not rewrite the three questions here |
| `specs/<feature>/decisions.md` | Chosen architecture, rejected alternatives, prototype branch |
| `specs/<feature>/tasks.md` | Atomic work, verification per row |

## From-scratch UI (step 5 — do not skip)

**Gate in:** `design.md` exists from case 1 or 2 in [VISUAL.md](VISUAL.md). If they have not picked a case, go back. Do not invent a look and jump here.

Order: **demo → user looks → `contract.ts` → test-contract draft → `gate_report.md`**. Then step 6.

| File | Role |
| --- | --- |
| `runs/<task>/artifacts/demo.html` (or equivalent single file) | **High-fidelity prototype** |
| `specs/<feature>/contract.ts` | States and data names locked |
| `specs/<feature>/e2e_spec.js` or `unit_spec.ts` | The exam paper for later code. UI → e2e draft. No-UI/logic-only → unit spec. One of them, not both required |
| `runs/<task>/gate_report.md` | Sign-off: demo opens, debug states reachable, contract matches demo |

### Demo constraints

- One file: CSS in `<style>`, JS in `<script>`, inline SVG. Double-click to open. No bundler.
- Pull tokens from `design.md` into `:root`. Follow the screen map. **No dead buttons.** No `alert()`.
- `MockDB` + `localStorage`; 200–500ms delay on writes so loading exists.
- Realistic mock data, not placeholder names.
- A small debug panel that can force every UI state in `design.md` (empty, loading, error, …).

Show the demo path. **Stop the turn.** Ask them to open it: what should change? If it feels cheap or too AI, polish per [VISUAL.md](VISUAL.md) (`taste` / `impeccable` if installed, else critique here) and ask again. Do **not** write `contract.ts` until they say the demo is the contract. Then extract `contract.ts` from the demo (states, field names, invariants). Then the test-contract draft from the proposal ACs (write ACs into `proposal.md` if they are still stubs). Then `gate_report.md`. Freeze specs as read-only for build.

## Existing high-fidelity prototype (step 5.5 — do not skip)

If they named case 3 but have not given a path, **stop** and ask for it. Keep the UI. Do not generate a new `demo.html`. Four steps, in order:

1. **Component list** — path, user-visible capability, data source (mock / hardcoded / real). Do not guess unread files.
2. **Mock sources** — file, what it fakes, what should replace it, which milestone. List what must not be expanded.
3. **MVP vs P2** — Prototype is often larger than MVP. P2 stays visible in the UI if needed but gets no backend task.
4. **Prototype → Task map** — each MVP row binds to a later task id.

Reverse-extract `design.md` from the UI if step 4 was skipped. Put the four tables in `tasks.md` (or `specs/<feature>/prototype-map.md` linked from it). **Stop.** Ask if the map is right before writing architecture tasks.

## No UI

Record `Prototype: none (no UI)` in `decisions.md`. Skip `design.md` and demo. Still write a unit test-contract draft if there is logic to lock.

## `contract.ts`

Lock UI states and data names. No string soup later. Include: state union, entity fields, invariants, routes if any. Use names taken from the demo or the existing UI — do not invent a parallel vocabulary.

## `decisions.md`

For each call: context, **chosen**, **rejected and why**. Record `Prototype branch: from-scratch | existing | none`. Schema/API tables only if the product has them.

Show the survey (at least two real options) **before** writing the file. After `tasks.md` exists, **stop** and ask if the split is right. Do not tell `/fancy-flow` the gate is green until they accept.

## `tasks.md`

Each row ≤ 2 hours, independently committable:

```markdown
- [ ] **Task-N: <name>**
  - **Does:** …
  - **Done when:** … (bind an AC id from proposal if one exists)
  - **Verify:** a command **and** an eyeball step a human can see (not "manually test")
  - **Depends on:** Task-… or none
```

Existing-prototype branch: de-mock tasks; do not add tasks that grow the mock. Never skip Verify.

If later stages edit `specs/` to make a test pass, restore `specs/` and fix the product code instead.

After tasks exist, Mini+: fill `memory/ARCHITECTURE.md` as a "want to do X → go here" map, and add Context Routing lines to `CLAUDE.md` (read `design.md` before UI, `contract.ts` before data, `tasks.md` before coding).
