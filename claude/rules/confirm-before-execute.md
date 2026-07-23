# Design settlement is not execution sign-off

Two gates, each needing an explicit user go:

- **Research → design:** after a research/exploration phase produces a design direction, present the synthesized findings and proposed direction in prose and let the user react — do not jump to scaffolding files. Exiting plan mode is not a signal to implement; the user may want to brainstorm first.
- **Design → execution:** settling grey areas one-by-one (AskUserQuestion, Q&A) fixes the *design*, not the go-ahead. For any repo-modifying task that followed a design discussion, write a plan doc first, present it, and wait for an explicit "go" before editing tracked files.

Keep the working tree clean by default — a branch may be under review or need to stay fresh for reasons only the user knows; ask before dirtying one. Write files only after explicit sign-off on the approach.
