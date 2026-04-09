# Git/GitHub

- Always prefer `gh` CLI over GitHub MCP for GitHub operations. Only use GitHub MCP as fallback when `gh` can't do it
- Only stage/commit when explicitly requested
- Never skip pre-commit hooks
- NEVER use `git add .` or `git add -A` — always stage files explicitly by name
- Always atomic commits: one commit per logical concern (use /atomic-commits skill)
- Conventional commits: `feat(auth): add login flow`, `fix: null check on render`
- NEVER commit project `.claude/settings.local.json`
