---
name: test
description: This skill should be used when the user asks to "run tests", "/test", "execute tests", or requests running the test suite.
version: 1.0.0
---

# Test Running

## Commands (Node/Frontend - Vitest)

- `npm test` - run tests
- `npm run test:watch` - watch mode
- `npm run test:ci` - with coverage

## Workflow

1. Run `npm test`
2. Report results concisely
3. Show failing test names and file paths

## Rules

- Default to `npm test`
- Don't modify tests unless requested
