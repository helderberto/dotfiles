---
paths:
  - "**/*.{ts,tsx}"
---

# TypeScript

- No `any` — `unknown` and narrow. No type assertions (`as Type`) without justification
- Never disable an ESLint rule, inline (`eslint-disable`) or in config. Fix the code
- No `@ts-ignore` / `@ts-expect-error` to make errors pass. If unavoidable (e.g. testing invalid scenarios), comment the reason
- Define types for all props/state/functions; `Readonly` for immutable props
- `interface` for object shapes. `type` only where an interface can't: unions, tuples, mapped/conditional types, `typeof` derivations
- No `enum`. Use an `as const` object, and derive its union with `(typeof X)[keyof typeof X]`

## Immutability (new code only — overrides "match existing style")

- No in-place mutation of shared data: `push`, `splice`, `shift`, `unshift`, `sort`, `reverse`, `delete`
- Use: spread, `slice`, `map`, `toSorted`, `toReversed`, `with`
- OK: local accumulators, constructors, refs
