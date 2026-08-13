# Fancy Locale

## What it does

Fancy Locale switches installed skill bodies between English (default) and Simplified Chinese. Harnesses read `SKILL.md`; Chinese lives in `SKILL.zh-CN.md` until you switch.

## When to reach for it

You invoke this by typing `/fancy-locale` — the agent won't reach for it on its own.

Reach for it after install if you want the pipeline to speak 简体中文.

## Prerequisites

Skills already installed into this project (`.claude/skills`, `.agents/skills`, or `.cursor/skills`).

## Common questions

**Does `npx skills add` ask for a language?**
No. That installer is not ours. Default is English; this skill (or `scripts/set-locale.sh`) is the switch.

**I switched and it still answers in English.**
Start a **new chat**. The old session may still hold the previous `SKILL.md`.

## It's working if

- After `zh-CN`, a new `/fancy-flow` session writes to the user in Chinese and follows the Chinese bodies.
- After `en`, it is English again.
- The fancy-skills git sources were not rewritten.

## Where it fits

Optional **post-install** switch. Neighbour: `/fancy-discover`.
