---
name: ship
description: This skill should be used when the user asks to "ship", "commit and push", "add all and push", or requests staging all changes, committing, and pushing.
version: 1.0.0
---

# Ship Changes

## Context

Run in parallel:
- `git status` (never -uall)
- `git diff HEAD`
- `git log --oneline -10`

## Workflow

1. Review all changes from status and diff
2. Analyze recent commit style from log
3. Generate commit message based on changed files matching repo style
4. In parallel (single message):
   - Stage all files: `git add -A`
   - Commit with HEREDOC format
   - Push: `git push` (current branch)
5. Run `git status` after to verify

## Rules

- Stage ALL changes with `git add -A`
- Generate message from changed files, match repo style
- NEVER force push (`-f` or `--force`)
- NEVER skip hooks
- NEVER commit secrets
- Push to current branch only
