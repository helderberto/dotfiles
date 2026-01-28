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

**Principles:**

- YAGNI - build only what's needed now
- SOLID - apply principles pragmatically
- KISS - keep it simple, avoid complexity
- Smallest changes to achieve goal
- Match surrounding code style > style guides
- Fix bugs immediately (no permission needed)
- Never invent technical details - research or state unknown

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
- Never test mocked behavior
- All test failures = your responsibility
- Test output must be pristine
- Create `customRender` helper with `defaultProps`
- Group tests: Rendering, User Interactions, Edge Cases
- Mock with MSW when needed

## Git/GitHub

- Use `gh` CLI for GitHub
- Never stage/commit unless explicitly told
- Never skip pre-commit hooks
- Check `git status` before `git add -A`

## Debugging

- Always find root cause, never fix symptoms
- Never add workarounds instead of fixing

## Plans

- At plan end: list unresolved questions (extremely concise)
