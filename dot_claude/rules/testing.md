---
paths:
  - "**/*.{test,spec}.*"
  - "**/__tests__/**"
---

# Testing

**Goal: Test real behavior, not mocks**

## Setup

- Detect the runner from the manifest; greenfield → Vitest + React Testing Library
- Wrap Testing Library in `src/lib/testing-library/index.ts`: re-export what tests use, plus a `customRender` with `defaultProps` that returns a `userEvent.setup()` instance as `user`

## Rules

- Mocking:
  - `vi.spyOn()` for most cases, easier to control
  - `vi.mock()` only for third-party libraries
  - `vi.stubGlobal()` for browser APIs
- Don't test mocked behavior - test real integration
- Every API endpoint gets an integration test
- Increasing a timeout is NEVER a fix for a slow or flaky test. Find the slow step and fix it
- Test output must be pristine (zero warnings/errors)
- Group: Rendering → User Interactions → Edge Cases
- Network: MSW for HTTP mocking
- Prefer `userEvent` over `fireEvent` — simulates real browser behavior
  - `userEvent` is slower. When an interaction is the slow step, switch to `fireEvent`
- If `render()` returns `user` (e.g. `const { user } = render(...)`), use that instance
  - Otherwise `const user = userEvent.setup()` before `render()`. Never call `userEvent.click()` on the default instance
- Split growing test files by feature/behavior. The runner parallelizes per file

## Queries

- Query by accessibility, not DOM structure. Never `container.querySelector`
- Prefer `screen` over queries destructured from `render()`
- Priority: `getByRole` → `getByLabelText` → `getByPlaceholderText` → `getByText` → `getByDisplayValue` → `getByAltText` → `getByTitle` → `getByTestId`
- `getByTestId` only when nothing above matches (e.g. dynamic text)
- Stuck on a query → `screen.logTestingPlaygroundURL()`

## Vitest Globals

- `globals: true` = no vitest imports needed
- `describe`, `it`, `expect`, `vi`, `beforeEach` auto-available
- Import Testing Library from the project's wrapper (`@/lib/testing-library`)

For test typing patterns, see [TypeScript](typescript.md)
