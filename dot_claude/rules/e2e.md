---
paths:
  - "**/*.cy.*"
  - "**/e2e/**"
  - "**/cypress/**"
  - "**/playwright/**"
---

# E2E

- Cover critical user flows only; edge cases belong in unit/integration tests
- Locators: role → label → text → test id. Never CSS/XPath
- Narrow by chaining/filtering, not by index
- Assert with auto-retrying assertions, never on a one-off read
- Never sleep or raise timeouts. Wait on an element, URL, or network response
- Tests are isolated: no shared state, no order dependence
- Authenticate once via saved session, not through the UI per test
- Stub third-party services; test only what you own
- Passing on retry is still flaky. Fix it, don't add retries
- Debug from traces/screenshots, not added logs
- Split specs by flow. Runners parallelize per file
- Always `await` actions and assertions. Lint with `@typescript-eslint/no-floating-promises`

## Playwright

- Shared setup in fixtures, combined with `mergeTests`. Specs import `test`/`expect` from the fixtures module
- Pre-load state (cookies, `localStorage`, hiding dev-only UI) by overriding `context` with `addCookies` / `addInitScript`
- Assert requests with `page.waitForRequest`. Create the promise before the triggering action
- CI: `trace: 'on-first-retry'`, install only the browsers used, shard large suites

## Cypress

- Use `@testing-library/cypress` queries (`cy.findByRole`, ...)
- Wait on aliased requests (`cy.intercept(...).as('x')` → `cy.wait('@x')`), never `cy.wait(ms)`
- No `{ force: true }` without a comment explaining why
- Log in with `cy.session()`
- Never assign command return values. Chain, `.then()` or alias
- Shadow DOM: wrap `cy.get(host).shadow()` + `.within()` in a custom command. Portals (toasts, modals) may live in a separate shadow root. `includeShadowDom` is the global alternative
