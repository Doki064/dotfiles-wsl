---
paths:
  - "**/CLAUDE.md"
  - "**/CLAUDE.local.md"
  - "**/AGENTS.md"
  - "**/.claude/rules/**"
---

# How to author CLAUDE.md / AGENTS.md files

Core thesis: **CLAUDE.md is a ROUTER, not a dump.**

- Keep it lean; the real constraint is an **instruction budget** (~150–200 instructions before adherence degrades uniformly; Claude Code's own system prompt eats ~50; some good CLAUDE.md files are <60 lines). Not a line count — use the **prune test**: "would removing this line cause a mistake? if not, cut it." Bloat causes instruction-DROPPING (if Claude keeps violating a rule, the file is too long — prune, don't add emphasis).
- **Segment into `docs/` and reference by plain path + brief description**, loaded on demand. Directory-level CLAUDE.md files layer on the root (root stays short/generic, subdirs add context — child-dir CLAUDE.md loads on-demand when a file there is read; parent dirs auto-load).
- **`@import` is EAGER** — `@path` in CLAUDE.md recursively auto-loads that file every session (= inlining, saves no context). For true on-demand routing use plain described paths, NOT `@`. Reserve `@` for the few always-load essentials. Skills are the officially-blessed on-demand tier.
- INCLUDE: project-specific knowledge not in LLM datasets, recurring-error guidance (update periodically), preferred coding/UI patterns, non-obvious gotchas, commands Claude can't guess, where data inputs live. EXCLUDE: common stack knowledge, what advanced LLMs already know, codebase-discoverable facts, premature "read X before needed" directives, file-by-file descriptions, mechanical style rules (use a linter/hook instead).
- **Generate STRUCTURE, not OPINIONS**: don't auto-generate the high-leverage judgment parts (the WHY, gotchas, taste-invariants) — generate the mechanical router skeleton + prompt the human for judgment. Don't clobber a hand-crafted CLAUDE.md; augment.
- Doc-shape differs: CLAUDE.md = loaded every turn → minimal; SPEC/PLAN = one-shot fresh-session inputs → can be denser. No single length rule.
- Deterministic must-happen rules → HOOKS (not advisory prose). Sometimes-relevant workflows → Skills. Focused rule topics → `.claude/rules/*.md`, path-scoped via `paths` frontmatter when only sometimes relevant.

Reference examples: karpathy CLAUDE.md (~95 lines, lean behavioral, good) vs caveman (~1000+ lines, file-by-file dump, cautionary — but its "single source of truth: edit X never the synced copies" rule is worth keeping).
