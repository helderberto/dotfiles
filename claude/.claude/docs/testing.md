# Testing

**Goal: Test real behavior, not mocks**

## Setup

- Jest/Vitest + React Testing Library
- Create `customRender` helper with `defaultProps`

## Rules

- Prefer `vi.spyOn` over `vi.mock` for your own code
- Only use `vi.mock` for third-party libraries
- Don't test mocked behavior - test real integration
- Test output must be pristine (zero warnings/errors)
- Group: Rendering → User Interactions → Edge Cases
- Network: MSW for HTTP mocking

## Vitest Globals

- `globals: true` = no vitest imports needed
- `describe`, `it`, `expect`, `vi`, `beforeEach` auto-available
- Only import `@testing-library/react`

For test typing patterns, see [TypeScript](typescript.md)
