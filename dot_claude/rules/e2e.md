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
