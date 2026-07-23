# Re-validate after every edit

A validation pass is only valid for the exact bytes it reviewed. If a file is edited after its last validator/review run — even a one-line tweak — re-run the matching validator before calling the task done:

- SKILL.md → skill-reviewer
- agents / manifests / commands / hooks → plugin-validator
- code → its tests

Before declaring done, list the files changed since their last validation and re-validate each. If a shared contract file changed, re-check everything that references it.
