---
paths:
  - "**/*.{ts,tsx}"
---

# TypeScript

- No `any` — `unknown` and narrow. No type assertions (`as Type`) without justification
- No `@ts-ignore` / `@ts-expect-error` / `eslint-disable` to make errors pass. If unavoidable (e.g. testing invalid scenarios), comment the reason
- Define types for all props/state/functions; `Readonly` for immutable props
- `interface` for objects, `type` for unions; objects over `enum`
- Object options for 3+ params

## Immutability (new code only — overrides "match existing style")

- No in-place mutation of shared data: `push`, `splice`, `shift`, `unshift`, `sort`, `reverse`, `delete`
- Use: spread, `slice`, `map`, `toSorted`, `toReversed`, `with`
- OK: local accumulators, constructors, refs
