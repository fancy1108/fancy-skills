# Shape artifacts

Paths use `specs/<feature>/` (default `core` when there is one product).

## Always

| File | Role |
| --- | --- |
| `specs/core/proposal.md` | Product truth, moved in at init. Do not rewrite the three questions here |
| `specs/<feature>/decisions.md` | Chosen architecture, rejected alternatives, and the prototype branch used |
| `specs/<feature>/tasks.md` | Atomic work, verification command per row |

## From-scratch UI

| File | Role |
| --- | --- |
| `specs/<feature>/design.md` | Visual contract (tokens, type, spacing, bans) |
| `runs/<task>/artifacts/demo.html` (or equivalent) | **High-fidelity prototype** — clickable, mock-backed |
| `specs/<feature>/contract.ts` | States and data names locked |

Optional on Mini: `e2e_spec.js` as a draft. Required only if the user asked for automated e2e in shape.

## Existing high-fidelity prototype

| File | Role |
| --- | --- |
| The user's running UI | **The prototype.** Do not replace it with a new demo.html |
| `design.md` | Reverse-extracted from that UI |
| Prototype → Task map + P2 table + mock-source list | Usually a section of `tasks.md` |

## No UI

Record `Prototype: none (no UI)` in `decisions.md`. Skip `design.md` and demo.

---

## `design.md` (from-scratch or reverse-extracted)

Keep it short. Must include:

- Named visual references (1–2)
- Color tokens (prefer `oklch()`)
- Type + spacing scale
- Screen map (which views exist and how they connect)
- At least **five visual bans** (card-itis, gray soup, rainbow gradients, generic Inter-on-white, dead empty states, …)

## `contract.ts`

Lock UI states and data names. No string soup in later code. Example shape:

```ts
export type UiState = "idle" | "loading" | "ready" | "error";
export interface Item {
  id: string;
  title: string;
}
```

## From-scratch `demo.html` constraints

- Prefer one file: CSS in `<style>`, JS in `<script>`, inline SVG. Double-click to open.
- Pull tokens from `design.md` into `:root`.
- Follow the screen map. **No dead buttons.**
- `MockDB` in JS; persist to `localStorage`; 200–500ms delay on writes so loading exists.
- Realistic mock data, not "lorem / John Doe".

## `decisions.md`

For each call: context, **chosen**, **rejected and why**. Record `Prototype branch: from-scratch | existing | none`. Schema/API tables only if the product has them. A local-only UI tool may decide "no backend in v1".

## `tasks.md`

Each row ≤ 2 hours, independently committable:

```markdown
- [ ] **Task-N: <name>**
  - **Does:** …
  - **Done when:** … (bind an AC id from proposal if one exists)
  - **Verify:** a command or an eyeball step a human can see (not "manually test")
  - **Depends on:** Task-… or none
```

Existing-prototype branch: include de-mock tasks; do not add tasks that grow the mock. A one-page tool may have ≤ 5 tasks. Never skip Verify.

If you catch later stages editing `specs/` to make a test pass, restore `specs/` and fix the product code instead.
