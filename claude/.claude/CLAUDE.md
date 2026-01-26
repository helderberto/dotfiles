- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.

## TypeScript

- No `any` - use `unknown` if needed
- No type assertions (`as Type`) without justification
- No `@ts-ignore`/`@ts-expect-error` without explanation
- Strict mode always
- Define types for all props/state/functions
- `Readonly` for immutable props
- `interface` for objects, `type` for unions
- Objects over `enum`

## Code Rules

**Immutability (mandatory):**
- No array mutations: `push`, `pop`, `splice`, `shift`, `unshift`, `[i]=`, `sort`, `reverse`
- No object mutations: `obj.key=`, `delete obj.key`
- Use spread, `slice`, `map`, destructuring

**Structure:**
- Small pure functions
- Max 2 nesting levels
- No nested ifs - use guards/early returns
- Single responsibility
- No comments unless explaining "why"
- Object options for 3+ params

**Naming:**
- Functions: `camelCase`, verb-based
- Types: `PascalCase`, noun-based
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case`

## Testing

- Jest/Vitest + React Testing Library
- Test behavior, not implementation
- Create `customRender` helper with `defaultProps`
- Group tests: Rendering, User Interactions, Edge Cases
- Mock with MSW when needed

## Git/GitHub

- Use `gh` CLI for GitHub
- Never stage/commit unless explicitly told
- At plan end: list unresolved questions (extremely concise)
