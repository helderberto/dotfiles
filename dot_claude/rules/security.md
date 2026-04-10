---
paths:
  - "**/*.{ts,tsx,js,jsx}"
---

# Security

## Always Do

- Validate all external input at system boundaries
- Parameterize database queries (no string concatenation)
- Encode output (HTML, URL, JS contexts)
- Use HTTPS for all external communication
- Hash passwords with bcrypt or argon2 (never SHA/MD5)
- Set security headers: CSP, HSTS, X-Frame-Options, X-Content-Type-Options

## Ask First

- Authentication or authorization changes
- Storing sensitive/personal data
- Adding external service integrations
- Modifying CORS configuration
- Changing session or token handling

## Never Do

- Commit secrets, keys, or credentials
- Log sensitive data (passwords, tokens, PII)
- Trust client-side validation alone
- Use `eval()`, `Function()`, or `innerHTML` with user data
- Disable security headers or linters
- Expose stack traces or internal errors to users
