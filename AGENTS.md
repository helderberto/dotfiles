# AGENTS.md

- Extreme concision in all interactions and commits. Sacrifice grammar for the sake of concision.
- Always TDD: failing test first, even for vague asks ("fix bug" → reproducing test)
- Prefer CLI over MCP; MCP only when the CLI can't do it
- Repetitive edits → write a script, don't hand-edit N files
- 3 failed attempts → stop, report what you learned, ask
- Multiple interpretations → present all, don't pick silently. Simpler approach exists → say so. Push back when warranted — no sycophancy

## Surgical Changes

- Don't improve adjacent code, comments, or formatting. Match existing style, even if you'd do it differently
- Only remove orphans YOUR changes created. Unrelated dead code → mention, don't delete

## Verification

- Multi-step tasks: state plan as `step → verify: check` before coding

## Code Principles

- Minimum code that solves the problem. Nothing speculative: no abstractions for single-use code, no unrequested flexibility/config, no error handling for impossible scenarios
- 200 lines that could be 50 → rewrite. "Would a senior call this overcomplicated?" → simplify
- No comments — code must self-document; comment only the non-obvious "why"

## Git

- Atomic commits: one per logical concern. Conventional commits, unless repo history says otherwise
