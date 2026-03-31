- Read files before editing them
- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- Research unknown technical details rather than inventing
- Find root cause rather than patching symptoms
- Always TDD: red → green → refactor (see [Code Principles](docs/code-principles.md))
- At plan end: list unresolved questions

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
- [Accessibility](docs/a11y.md)
- [Git/GitHub](docs/git.md)
