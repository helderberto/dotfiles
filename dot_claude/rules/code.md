# Code

Applies to every language. Enforce with the project's linter where one exists. Framework conventions (Next.js, TanStack Start) win where they collide with these rules.

- No inline ifs. Always use braces and a block, even for one statement (ESLint `curly: all`).
- Functions take at most 2 parameters. For more, pass one options object, so callers name each argument and can't swap their order (ESLint `max-params: 2`). Signatures imposed by a library or framework are exempt; mark them with the reason.
- A file nearing 200 lines gets split into smaller files by concern. Each new file gets its own unit tests (ESLint `max-lines`).
