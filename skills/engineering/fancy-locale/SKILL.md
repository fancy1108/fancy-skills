---
name: fancy-locale
description: Switch this collection between English (default) and Simplified Chinese skill instructions.
disable-model-invocation: true
---

# Fancy Locale

Harnesses load `SKILL.md`. This collection ships English in `SKILL.md` and Simplified Chinese in `SKILL.zh-CN.md`. This skill copies the chosen language onto `SKILL.md` in the **installed** copies (`.claude/skills`, `.agents/skills`, `.cursor/skills`).

## Default

English. Do nothing if the user wants English.

## Process

1. Ask once: English (default) or 简体中文?
2. Run the script from this skill folder:

```bash
bash "<this-skill>/scripts/set-locale.sh" en
# or
bash "<this-skill>/scripts/set-locale.sh" zh-CN
```

Resolve `<this-skill>` to the installed path (the folder that contains this `SKILL.md`).

3. Tell the user to **start a new chat**. The current session may still be holding the old `SKILL.md`.

Do not edit files under the fancy-skills git repo `skills/` directory. Do not invent a third locale.
