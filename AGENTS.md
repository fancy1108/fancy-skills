Skills are organized into bucket folders under `skills/`:

- `engineering/` — daily code work
- `productivity/` — daily non-code workflow tools
- `misc/` — kept around but rarely used, not promoted
- `in-progress/` — beta: public on purpose, feedback wanted, not shipped in the plugin
- `deprecated/` — no longer used

Every skill in `engineering/` or `productivity/` (the **promoted** buckets) must have a reference in the top-level `README.md` and an entry in `.claude-plugin/plugin.json`'s `skills` array. Skills in `misc/`, `in-progress/`, and `deprecated/` must not appear in either.

Install commands are copied verbatim from [`.agents/install-block.md`](.agents/install-block.md). `.claude-plugin/marketplace.json` makes the repo its own single-plugin marketplace. After touching either manifest, run `claude plugin validate . --strict` if the CLI is available.

Each skill entry in the top-level `README.md` must link the skill name to its `SKILL.md`.

Each bucket folder has a `README.md` that lists every skill in the bucket with a one-line description, with the skill name linked to its `SKILL.md`. The promoted buckets' `README.md`s and the top-level `README.md` group entries into **User-invoked** and **Model-invoked**; non-promoted bucket `README.md`s use a flat list.

Skills in `engineering/` and `productivity/` also have a human-facing docs page at `docs/<bucket>/<name>.md`. Skills in the non-promoted buckets get **no** docs page.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` plus `policy.allow_implicit_invocation: false` in `agents/openai.yaml`) or model-invoked. See [`.agents/invocation.md`](.agents/invocation.md).

[`ask-fancy`](./skills/engineering/ask-fancy/SKILL.md) is the router. Its **Available skills** section is generated — never edit it by hand. After adding, renaming, or removing a promoted skill, update `.claude-plugin/plugin.json` and the bucket `README.md`, then run `scripts/build-router.sh`. See [`.agents/adding-a-skill.md`](.agents/adding-a-skill.md).

To (re)link every skill into local harness directories (`~/.claude/skills`, `~/.agents/skills`, `~/.cursor/skills`), run `scripts/link-skills.sh`.
