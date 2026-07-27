# Documentation quality

Documentation is judged on two axes: the **five Cs** — is the content good? — and **readability mechanics** — can a reader absorb it? The five Cs apply to human-oriented docs (READMEs, guides, docstrings, handoffs, changelogs, comments meant for readers). The readability mechanics apply to *all* docs, model-facing ones included.

## The five Cs

- **Clarity** — simple, precise, unambiguous language a reader outside this session can follow: no jargon, unexplained shorthand, codenames, or context that only exists in the author's head; concrete examples over abstract description.
- **Conciseness** — every sentence earns its place; cut fluff and repetition, keep what changes what the reader knows or does. Conciseness means selecting what to include, not compressing prose into fragments.
- **Correctness** — every fact, instruction, metric, and reference matches current behavior/bytes; verify against the code, don't write from memory. A wrong doc is worse than no doc.
- **Completeness** — covers what the target reader needs to succeed at the doc's purpose (including failure modes and prerequisites), not everything that could be said.
- **Consistency** — uniform terminology, formatting, tone, and structure across the doc set: one name per concept, parallel structure for parallel content, so readers know what to expect. Match the conventions of existing docs before inventing new ones.

When conciseness and completeness pull apart, completeness of the *reader's task* wins — trim scope, not necessary steps. Before finishing a doc, reread it as its target reader and fix what fails a C.

- **Walkthroughs sit in the reader's seat.** Example/tutorial docs are written as what the reader types and sees (You type / You'll be asked / What lands / Next), never as a tour of the system's internal stages — internals narration is the single biggest readability failure in generated example docs. Mechanism gets one sentence and a pointer to the reference doc.
- **Build/phase progress never lives in committed docs.** Committed docs describe the product (README, USAGE, CHANGELOG, architecture); "what's built, what's next" is dev-session state and belongs in local files (handoff, plans). A status section in a committed file is drift bait.

## Readability mechanics (all docs, including model-facing)

These govern how the words sit on the page, not what they say — so unlike the five Cs they apply to model-facing docs too (CLAUDE.md, rules, agent and skill prompts, memory notes, plan/handoff files). Two reasons: humans open and review those, and clear structure also improves how a model retrieves and follows them. **The one caution for model-facing docs:** restructure for scannability *without inflating* — a lean, front-loaded, labeled shape, not a bullet farm.

**Spacing — the gaps between blocks.** A wall of text fails even when every sentence in it passes. Break prose into short paragraphs (one idea each, blank line between), use headings to mark section boundaries, and reach for a list or table when the content is enumerable. A paragraph past ~5 sentences, or a section with no visual break, gets restructured.

**Structure — the density within a block.** A paragraph can be short and well-spaced yet still read as a wall because it chains too many ideas into one run-on. The fixes:

- **Front-load the point (BLUF).** Lead with the conclusion; put rationale after. Don't bury the takeaway mid-sentence.
- **Decompose the chain.** Two-plus semicolon-joined independent clauses, or a parenthetical nested inside a parenthetical, is the tell. Parallel or enumerable pieces become a list; sequential or causal pieces become separate sentences.
- **Never fragment a conditional.** A "do X because Y, unless Z" chain stays one sentence — splitting its because/unless glue into disconnected bullets is what breaks a model's instruction-following (and loses a human reader too).
- **Label the chunks.** One topic per chunk, each with a bold lead-in label the scanning eye — and the model — catches. Keep lists near ≤7 items and nesting shallow; use a symbol only as a consistent semantic marker (e.g. ⚠️ gotcha, ✅ verified, ❌ anti-pattern), never decoration.
