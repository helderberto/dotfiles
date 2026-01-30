# Code Principles

## Immutability (mandatory)

- No array mutations: `push`, `pop`, `splice`, `shift`, `unshift`, `[i]=`, `sort`, `reverse`
- No object mutations: `obj.key=`, `delete obj.key`
- Use spread, `slice`, `map`, destructuring

## Structure

- Max 2 nesting levels
- No nested ifs - use guards/early returns
- No comments unless explaining "why"
- Object options for 3+ params

## Naming

- Functions: `camelCase`, verb-based
- Types: `PascalCase`, noun-based
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case`
