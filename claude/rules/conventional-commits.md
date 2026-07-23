# Conventional Commits

Every commit message follows Conventional Commits: `type(scope): subject`.

- **Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- **Scope:** optional but preferred.
- **Subject:** imperative, lowercase, no trailing period.
- **Breaking changes:** `!` after type/scope plus a `BREAKING CHANGE:` footer.

If a repo defines its own commit convention (commitlint config, CONTRIBUTING.md, or an established `git log` pattern), the repo's convention wins.
