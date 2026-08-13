# Hunt queries (step 1)

Search for what is broken. Prefer recent posts (last 1–2 years from **today's date**, not a guessed year). Keep the domain of the seed if they gave one.

Do not put a calendar year in the query unless you already know today's date. Never default to 2024.

Run `scripts/hunt.py`, not Claude `WebSearch`. Put `site:reddit.com` / `site:zhihu.com` / `site:v2ex.com` in the query so the results are complaints, not SEO.

## Pain

- "I hate that [category] …"
- "why isn't there a tool that does A and B"
- "how do I [job] without [bloated app]"
- site:reddit.com [category] "uninstalled" OR "too complicated" OR "just want"

## Gap

- [competitor] 1 star review
- [competitor] "feature request" ignored / years
- [category] "too many features" OR "just want to log"

## Edge

- [new API or model] [old job]
- "I built a weekend [category] tool"

## Seed

If they named a category, search **that** category's incumbents, 1-star reviews, and "I hate that…" posts. Do not wander into an unrelated field.
