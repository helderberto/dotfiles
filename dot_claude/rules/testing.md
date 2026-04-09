---
paths:
  - "**/*.{test,spec}.*"
  - "**/__tests__/**"
---

# Testing

**Goal: Test real behavior, not mocks**

## Setup

- Default: Vitest + React Testing Library (if no Vitest, check for Jest)
- Create `customRender` helper with `defaultProps`

## Rules

- Prefer `vi.spyOn` over `vi.mock` for your own code
- Only use `vi.mock` for third-party libraries
- Don't test mocked behavior - test real integration
- Test output must be pristine (zero warnings/errors)
- Group: Rendering → User Interactions → Edge Cases
- Network: MSW for HTTP mocking
- Prefer `userEvent` over `fireEvent` — simulates real browser behavior
- If `render()` returns `user` (e.g. `const { user } = render(...)`), use that instance
- Prefer `getByRole` / `getByText` over `container.querySelector` — query by accessibility, not DOM structure

## Vitest Globals

- `globals: true` = no vitest imports needed
- `describe`, `it`, `expect`, `vi`, `beforeEach` auto-available
- Only import `@testing-library/react`

For test typing patterns, see [TypeScript](typescript.md)
