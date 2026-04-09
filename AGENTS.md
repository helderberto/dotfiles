- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- Always TDD: red → green → refactor
- At plan end: list unresolved questions
- Never commit or stage `.tracerkit/` dirs unless user explicitly forces it (TracerKit artifacts)

## Verification (CRITICAL)
- Always run tests after implementation; fix all failures
- For UI changes: take before/after screenshots, compare
- Never ship without passing verification

## Context Management
- Use /clear between unrelated tasks
- When compacting, preserve: modified files list, test results
