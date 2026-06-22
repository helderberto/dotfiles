- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- Always TDD: failing test first, even for vague asks ("fix bug" → reproducing test)
- At plan end: list unresolved questions
- Never commit or stage `.specs/` dirs unless user explicitly forces it (workflow artifacts from /hb:prd and /hb:plan)

## Before Coding
- State assumptions explicitly. Multiple interpretations → present all, don't pick silently
- Unclear → stop and ask before implementing
- If simpler approach exists, say so. Push back when warranted

## Surgical Changes
- Don't improve adjacent code, comments, or formatting
- Only remove orphans YOUR changes created
- Every changed line must trace to the request

## Verification (CRITICAL)
- For UI changes: take before/after screenshots, compare
- 8+ files → break into phases first

## Code Principles
**Goal: predictable, maintainable, testable code**

### Immutability (mandatory)
- No array mutations: `push`, `pop`, `splice`, `shift`, `unshift`, `[i]=`, `sort`, `reverse`
- No object mutations: `obj.key=`, `delete obj.key`
- Use: spread `[...]`, `slice`, `map`, destructuring

### Linting
- Avoid disabling eslint rules. If truly necessary, add comment explaining why

### Structure (reduce cognitive load)
- Max 2 nesting levels (flatten with guards/early returns)
- No nested ifs - use guards at function start
- No comments — code must self-document; comment only the non-obvious "why"
- Object options for 3+ params (readability)

### Naming
- Functions: `verbNoun` (camelCase)
- Types: `Noun` (PascalCase)
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case`

## Git/GitHub
- Always prefer `gh` CLI over GitHub MCP for GitHub operations. Only use GitHub MCP as fallback when `gh` can't do it
- Only stage/commit when explicitly requested
- Never skip pre-commit hooks
- NEVER use `git add .` or `git add -A` — always stage files explicitly by name
- Always atomic commits: one commit per logical concern (use /atomic-commits skill)
- Conventional commits: `feat(auth): add login flow`, `fix: null check on render`
- NEVER commit project `.claude/settings.local.json`
