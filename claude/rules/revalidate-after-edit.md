# Re-validate after every edit

A validation pass is only valid for the exact bytes it reviewed. Any edit after the last validator/review run — a one-line tweak, a formatting pass, a docs-quality sweep (five Cs, spacing, structure) — makes that pass stale. Prose-only edits count fully: a skill or agent IS its markdown, so editing the markdown edits the component.

- SKILL.md → skill-reviewer
- agents / manifests / commands / hooks → plugin-validator
- code → its tests

The edit itself creates the validation debt — it is owed whether or not a validator ran earlier in the session, and regardless of why the file was touched.

**Before declaring done (mechanical, every time):** enumerate every file edited during the task, map each to its validator from the list above, and run every validator that has an edit newer than its last pass. Bulk sweeps over many files get no exemption — batch the files per validator. If a shared contract file changed, re-check everything that references it.
