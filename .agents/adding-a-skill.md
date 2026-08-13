# Adding a skill

Promoted skills (`engineering/` or `productivity/`) are the ones that ship. Follow this order so the install list and the router cannot drift.

1. Create `skills/<bucket>/<name>/` with `SKILL.md` and `agents/openai.yaml`. See [invocation.md](./invocation.md).
2. Add a one-line entry to `skills/<bucket>/README.md`, linking the name to `./<name>/SKILL.md`, under **User-invoked** or **Model-invoked**.
3. Add a docs page at `docs/<bucket>/<name>.md` (promoted buckets only).
4. Append the skill path to `.claude-plugin/plugin.json` `skills` (for example `./skills/engineering/<name>`). This array is the **single source of truth** for what ships.
5. Add the same skill to the Reference section in both `README.md` (English) and `README.zh-CN.md` (Chinese), linking to its `SKILL.md`.
6. Run `scripts/build-router.sh`. It rewrites the generated inventory in `skills/engineering/fancy-discover/SKILL.md` from `plugin.json` + each skill's frontmatter. **Do not edit that inventory by hand.**
7. If `fancy-discover`'s handwritten map needs a new flow (not just a new list row), edit the prose **outside** the `BEGIN/END GENERATED INVENTORY` markers.
8. Run `scripts/build-router.sh --check` to confirm the generated section matches.

## Removing or renaming

- Remove or rename the folder, the bucket README row, the docs page, the rows in `README.md` and `README.zh-CN.md`, and the `plugin.json` path.
- Run `scripts/build-router.sh`.
- Update any handwritten flow in `fancy-discover` that named the old skill.

## Non-promoted buckets

Skills in `misc/`, `in-progress/`, and `deprecated/` get a folder + bucket README row only. They must **not** appear in `plugin.json`, the top-level README Reference, `fancy-discover`'s generated inventory, or `docs/`.

Promoting out of `in-progress/`: fill in a real `SKILL.md` (a stub that refuses is not enough), then follow the promoted steps above and delete the in-progress folder / backlog row.
