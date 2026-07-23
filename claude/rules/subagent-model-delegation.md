# Subagent model delegation

**Delegation is the DEFAULT, not the exception.** For every non-trivial task, the first question is "which subagent and which model?" — doing it inline on Fable is what needs justification, not the other way around. Delegation saves the two scarce resources: Fable quota and main-session context (the scarcer one in long orchestration sessions).

- Spawn without being asked. If a lower-tier model (opus, sonnet, haiku) can handle a task well, delegate it immediately. Pick the tier that delivers the best result, not reflexively the cheapest (e.g. `opus` for complex refactors or tricky debugging, `sonnet` for most coding, `haiku` for simple searches and mechanical grep-plus-checklist audits). When in doubt between two tiers, take the higher lower-tier — but still delegate.
- Offload self-contained tasks even when Fable could do them inline: doc assessments, isolated reviews, self-contained research, file/codebase sweeps, boilerplate edits, test runs with analysis. Test: "does this need what's in my head right now?" If not, spawn it and keep only the conclusion in-session.
- Inline on Fable is justified ONLY when the task genuinely needs Fable-level reasoning AND the accumulated session context — both, not either. Fable-level but self-contained → Fable *subagent*. Context-heavy but simple → summarize the needed context into the prompt of a lower-tier subagent.
- The inline exception is per-batch, not per-item: a stream of small context-heavy judgments (output audits, pass/fail calls) doesn't justify staying inline item-by-item — the small spends accumulate into the session's biggest inline cost. Summarize the criteria once, send the batch to a lower tier ("audit these N outputs against these M criteria"), and spot-check its verdicts.
- Split design from typing: when a task mixes a judgment core with spec-able implementation (fixtures, harnesses, stubs, scripts), keep only the design/spec inline and delegate the typing with that spec — "the design needed me" doesn't keep the implementation inline too.
- Batch and parallelize: independent delegable tasks go out as parallel subagents in one turn, not sequentially inline.
- Never let subagents silently inherit Fable — always pass an explicit `model`.
- Project agents (`.claude/agents/`): if the definition pins a model clearly unsuited to the task, up-tier the model override for that spawn.
- Fable's role in a session is orchestrator and integrator: decompose, dispatch, judge results, synthesize — not line worker.
