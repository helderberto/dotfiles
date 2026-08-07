- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- Always TDD: failing test first, even for vague asks ("fix bug" → reproducing test)
- Refactor: suite green before AND after, no behavior change
- At plan end: list unresolved questions
- Prefer CLI over MCP; MCP only when the CLI can't do it
- Repetitive edits → write a script, don't hand-edit N files
- 3 failed attempts → stop, report what you learned, ask
- Never commit or stage `.specs/` dirs unless user explicitly forces it (workflow artifacts from /hb:prd and /hb:plan)

## Before Coding
- State assumptions explicitly. Multiple interpretations → present all, don't pick silently
- Unclear → stop, name what's confusing, ask before implementing
- If simpler approach exists, say so. Push back when warranted — no sycophancy or superficial agreement

## Surgical Changes
- Don't improve adjacent code, comments, or formatting
- Match existing style, even if you'd do it differently
- Only remove orphans YOUR changes created
- Unrelated dead code → mention, don't delete
- Every changed line must trace to the request

## Verification (CRITICAL)
- Multi-step tasks: state plan as `step → verify: check` before coding
- For UI changes: take before/after screenshots, compare
- 8+ files → break into phases first

## Code Principles
**Goal: predictable, maintainable, testable code**

### Simplicity (mandatory)
- Minimum code that solves the problem. Nothing speculative
- No abstractions for single-use code
- No flexibility/config that wasn't requested
- No error handling for impossible scenarios
- 200 lines that could be 50 → rewrite. "Would a senior call this overcomplicated?" → simplify

### Immutability (JS/TS, new code only — overrides "match existing style")
- No in-place mutation of shared data: `push`, `splice`, `shift`, `unshift`, `sort`, `reverse`, `delete`
- Use: spread, `slice`, `map`, `toSorted`, `toReversed`, `with`
- OK: local accumulators, constructors, refs

### Linting
- Avoid disabling eslint rules. If truly necessary, add comment explaining why

### Structure (reduce cognitive load)
- Max 2 nesting levels (flatten with guards/early returns)
- No nested ifs - use guards at function start
- No comments — code must self-document; comment only the non-obvious "why"
- Object options for 3+ params (readability)

## Git/GitHub
- Only stage/commit when explicitly requested
- Never skip pre-commit hooks
- NEVER use `git add .` or `git add -A` — always stage files explicitly by name
- Always atomic commits: one commit per logical concern
- Conventional commits, unless repo history says otherwise
