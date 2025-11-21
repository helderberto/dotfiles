# TypeScript Guidelines

## Strict Typing

- **No** `any` - ever. Use `unknown` if type is truly unknown
- **No Type Assertions** avoid `as SomeType` unless absolutely necessary with clear justification
- **No @ts-ignore** or **@ts-expect-error** without explicit explanation
- Use `strict` mode in `tsconfig.json`

## Type Definitions

- Define interfaces/types for all props, state, and function signatures
- Use `Readonly` for props that should not be mutated
- Prefer `interface` over `type` for object shapes unless using union types
- Use objects instead of `enum` where possible for better tree-shaking
