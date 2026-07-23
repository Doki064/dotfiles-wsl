---
paths:
  - "**/SKILL.md"
  - "**/skills/**"
  - "**/agents/*.md"
  - "**/.claude-plugin/**"
---

# Plugin path variables (verified against Claude Code 2.1.208 binary)

`${CLAUDE_PLUGIN_ROOT}` IS substituted in plugin skill bodies AND agent bodies (plus commands and hooks) — the official docs' substitution table omits it but the runtime substitutes it unconditionally, along with `${CLAUDE_PROJECT_DIR}` and `${CLAUDE_PLUGIN_DATA}`. Skill bodies additionally get `${CLAUDE_SKILL_DIR}` (the skill's own subdir), `${CLAUDE_SESSION_ID}`, `${CLAUDE_EFFORT}`.

- Preferred convention: `${CLAUDE_PLUGIN_ROOT}/<subdir>/<file>` everywhere (skills, agents, hooks) — uniform, no `../..` traversal. Use `${CLAUDE_SKILL_DIR}` only when a skill needs its *own* subdir.
- Do NOT treat the docs table as proof a variable is unavailable — confirm against the binary.
- `${CLAUDE_PLUGIN_ROOT}` is unset as a shell env var in the Bash tool; irrelevant — substitution is string-replace at load time, not shell env.
