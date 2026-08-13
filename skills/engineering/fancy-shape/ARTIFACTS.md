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

## Existing high-fidelity prototype

| File | Role |
| --- | --- |
| The user's running UI | **The prototype.** Do not replace it with a new demo.html |
| `design.md` | Reverse-extracted from that UI |
| Prototype → Task map + P2 table + mock-source list | Usually a section of `tasks.md` |

## No UI

Record `Prototype: none (no UI)` in `decisions.md`. Skip `design.md` and demo.
