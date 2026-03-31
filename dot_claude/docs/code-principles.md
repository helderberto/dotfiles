# Code Principles

**Goal: Predictable, maintainable, testable code**

## Immutability (mandatory)

**Why: Prevents bugs from unexpected state changes**

- No array mutations: `push`, `pop`, `splice`, `shift`, `unshift`, `[i]=`, `sort`, `reverse`
- No object mutations: `obj.key=`, `delete obj.key`
- Use: spread `[...]`, `slice`, `map`, destructuring

## Linting

- Avoid disabling eslint rules. If truly necessary, add comment explaining why

## Structure

**Why: Reduce cognitive load**

- Max 2 nesting levels (flatten with guards/early returns)
- No nested ifs - use guards at function start
- No comments unless explaining "why" (code explains "what")
- Object options for 3+ params (readability)

## Naming

- Functions: `verbNoun` (camelCase)
- Types: `Noun` (PascalCase)
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case`
