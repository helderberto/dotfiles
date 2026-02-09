---
name: amend-push
description: This skill should be used when the user asks to "amend and push", "/amend-push", or wants to amend the last commit and force push.
version: 1.0.0
---

# Amend and Push

## Context

Stage changes, amend the previous commit, and force push to remote.

## Workflow

1. Check git status
2. Verify current branch (never force push main/master)
3. Stage specified files (or all with `-a`)
4. Amend previous commit:
   - Use `--no-edit` to keep message
   - Or allow editing if requested
5. Force push with `--force-with-lease` for safety
6. Show result and final status

## Safety Rules

- **NEVER** force push to main/master branches
- Use `--force-with-lease` instead of `--force`
- Verify branch has upstream tracking
