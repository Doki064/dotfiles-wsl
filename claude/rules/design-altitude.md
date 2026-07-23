# Keep design discussions at design altitude

When designing a system, split decisions by altitude:

- **Decide now (DESIGN altitude):** architecture, behavior, principles — the things the rest of the design hangs on.
- **Defer (IMPLEMENTATION altitude):** model selection, config surface, tooling, cost numbers, exact taxonomies — settle each in the build phase that needs it, per phase, not all up front.

The user drives one topic at a time; don't fan out into parallel threads. On genuinely open design questions, offer to research rather than guess.
