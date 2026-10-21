---
paths:
  - "**/*.{test,spec}.*"
  - "**/__tests__/**"
---

# Testing

**Goal: Test real behavior, not mocks**

## Setup

- Detect the runner from the manifest; greenfield → Vitest + React Testing Library
- Create `customRender` helper with `defaultProps`

## Rules

- Mocking:
  - `vi.spyOn()` for most cases, easier to control
  - `vi.mock()` only for third-party libraries
  - `vi.stubGlobal()` for browser APIs
- Don't test mocked behavior - test real integration
- Increasing a timeout is NEVER a fix for a slow or flaky test. Find the slow step and fix it
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
