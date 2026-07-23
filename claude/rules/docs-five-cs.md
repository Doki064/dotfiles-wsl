# Documentation: the five Cs

All human-oriented documentation (READMEs, guides, docstrings, handoffs, changelogs, comments meant for readers) is measured against five Cs:

- **Clarity** — simple, precise, unambiguous language a reader outside this session can follow: no jargon, unexplained shorthand, codenames, or context that only exists in the author's head; concrete examples over abstract description.
- **Conciseness** — every sentence earns its place; cut fluff and repetition, keep what changes what the reader knows or does. Conciseness means selecting what to include, not compressing prose into fragments.
- **Correctness** — every fact, instruction, metric, and reference matches current behavior/bytes; verify against the code, don't write from memory. A wrong doc is worse than no doc.
- **Completeness** — covers what the target reader needs to succeed at the doc's purpose (including failure modes and prerequisites), not everything that could be said.
- **Consistency** — uniform terminology, formatting, tone, and structure across the doc set: one name per concept, parallel structure for parallel content, so readers know what to expect. Match the conventions of existing docs before inventing new ones.

Spacing is part of clarity, not decoration: a wall of text fails the five Cs even when every sentence in it passes. Break prose into short paragraphs (one idea each, blank line between), use headings to mark section boundaries, and reach for a list or table when the content is enumerable. If a paragraph runs past ~5 sentences or a section has no visual break, restructure it.

When conciseness and completeness pull apart, completeness of the *reader's task* wins — trim scope, not necessary steps. Before finishing a doc, reread it as its target reader and fix what fails a C.
