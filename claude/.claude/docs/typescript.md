# TypeScript

- No `any` - use `unknown` if needed
- No type assertions (`as Type`) without justification
- No `@ts-ignore`/`@ts-expect-error` without explanation
- Define types for all props/state/functions
- `Readonly` for immutable props
- `interface` for objects, `type` for unions
- Objects over `enum`

For structure and naming conventions, see [Code Principles](code-principles.md)
