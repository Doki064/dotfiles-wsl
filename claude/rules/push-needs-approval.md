# Pushing to default or release branches requires explicit in-the-moment approval

A `git push` targeting the default branch (main/master) or a release branch needs the user's explicit approval in the moment — a handoff, milestone brief, or plan document saying "push and tag" does not pre-authorize it. The user wants a final human gate on anything landing on those branches. Pushing a feature/topic branch to a remote is fine without asking.

**How to apply:** Run the work up to and including local commits and local tags; stop and ask before a push that targets a default or release branch (including tag pushes that cut a release). Before proposing such a push, scan the diff for confidential material (see `enterprise-context-no-leak.md`).
