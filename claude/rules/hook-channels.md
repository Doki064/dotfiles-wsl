---
paths:
  - "**/hooks/**"
  - "**/settings.json"
---

# Hook output channels: what verifiably reaches the model

All verified empirically on Claude Code 2.1.209 (throwaway `claude -p` runs, distinct codeword payloads, hook side-effect markers proving the hook fired). The docs are stale or silent on several of these — never build on a hook channel whose model-visibility hasn't been verified this way.

**PreToolUse — `systemMessage` on allow NEVER reaches the model** (re-verified 2026-07-15, both directions). A hook emitting `permissionDecision: "allow"` with a `systemMessage` runs fine, but the model never receives the message. The plugin-dev docs claiming "systemMessage: message shown to Claude" are stale for this case.

**PreToolUse — the deny reason DOES reach the model.** Emit `{"decision": "block", "reason": <msg>, "hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "deny", "permissionDecisionReason": <msg>}}` — the reason verifiably arrives pre-call. For a non-blocking warning, use a **deny-once gate**: record a dedupe marker before denying so the immediate retry passes silently, and end the reason with "retry the same call now and it will go through". Reference implementation: `~/projects/lore/hooks/tripwire.js`.

**SessionStart — BOTH channels reach the model** (verified 2026-07-14, re-verified 2026-07-15): `hookSpecificOutput.additionalContext` JSON and plain exit-0 stdout each land in model context as system-reminders. Prefer the documented `additionalContext` form.

**UserPromptSubmit — `additionalContext` reaches the model** (verified 2026-07-16). It fires on EVERY prompt — per-turn injection with no built-in dedupe; a hook wanting once-per-session behavior there must keep its own state.
