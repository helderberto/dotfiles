---
paths:
  - "**/*.{ts,tsx,js,jsx}"
---

# Security

## Ask First

- Authentication or authorization changes
- Storing sensitive/personal data
- Adding external service integrations
- Modifying CORS configuration
- Changing session or token handling

## Never Do

- Commit secrets, keys, or credentials
- Log sensitive data (passwords, tokens, PII)
- Disable security headers or linters
- Expose stack traces or internal errors to users
