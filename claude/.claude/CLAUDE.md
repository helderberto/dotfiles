- Read files before editing them
- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- Research unknown technical details rather than inventing
- Only stage/commit when explicitly requested
- Use `gh` CLI for GitHub operations
- No comments in code unless truly necessary. Code should be self-documenting.
- Avoid disabling eslint rules. If truly necessary, add comment explaining why.
- Find root cause rather than patching symptoms

## Verification (CRITICAL)
- Always run tests after implementation; fix all failures
- For UI changes: take before/after screenshots, compare
- Never ship without passing verification

## Context Management
- Use /clear between unrelated tasks
- When compacting, preserve: modified files list, test results
- Use /rewind (Esc+Esc) to restore checkpoints

For specific conventions, see:

- [TypeScript](docs/typescript.md)
- [Code Principles](docs/code-principles.md)
- [Testing](docs/testing.md)
- [Accessibility](docs/accessibility.md)
- [Internationalization](docs/internationalization.md)
- [Git/GitHub](docs/git.md)
- [Planning](docs/planning.md)
