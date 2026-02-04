---
name: open-pr
description: This skill should be used when the user asks to "open pr", "/open-pr", or wants to open the current pull request in the browser.
version: 1.0.0
---

# Open Pull Request

## Context

Opens the current pull request in the browser using GitHub CLI.

## Command

Run:
- `gh pr view --web` - opens current PR in default browser

## Rules

- **GitHub only** - requires GitHub remote (not GitLab, Bitbucket, etc.)
- Must be in a git repository with GitHub remote
- Must have an open PR for the current branch
- If no PR exists, command will fail with helpful error
