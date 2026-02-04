---
name: open-repo
description: This skill should be used when the user asks to "open repo", "/open-repo", or wants to open the current repository in the browser.
version: 1.0.0
---

# Open Repository

## Context

Opens the current repository in the browser using GitHub CLI.

## Command

Run:
- `gh repo view --web` - opens current repo in default browser

## Rules

- **GitHub only** - requires GitHub remote (not GitLab, Bitbucket, etc.)
- Must be in a git repository with GitHub remote
- Opens repository overview page on GitHub
