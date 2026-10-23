# Code

Applies to every language. Enforce with the project's linter where one exists.

- No inline ifs. Always use braces and a block, even for one statement (ESLint `curly: all`).
- Functions take at most 2 parameters. For more, pass one options object (ESLint `max-params: 2`). Signatures imposed by a library or framework are exempt; mark them with the reason.
- A file nearing 200 lines gets split into smaller files by concern. Each new file gets its own unit tests (ESLint `max-lines`).
