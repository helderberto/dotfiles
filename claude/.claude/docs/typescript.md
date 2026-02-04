# TypeScript

- No `any` - use `unknown` if needed
- No type assertions (`as Type`) without justification
- Avoid `@ts-ignore`/`@ts-expect-error`. If truly necessary (e.g., testing invalid scenarios), add comment explaining why
- Define types for all props/state/functions
- `Readonly` for immutable props
- `interface` for objects, `type` for unions
- Objects over `enum`

For structure and naming conventions, see [Code Principles](code-principles.md)
