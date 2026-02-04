Base directory for this skill: /Users/hberto/.claude/skills/amend-push

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
- Warn user before force pushing
- Use `--force-with-lease` instead of `--force`
- Verify branch has upstream tracking
- Check for uncommitted changes first
- Show clear confirmation of what was pushed

## Usage Examples

```bash
/amend-push file1.ts file2.tsx
/amend-push -a
/amend-push -e file.ts  # Edit message before push
```

## Warning

Force pushing rewrites history. Only use when:
- Working on feature branches
- Commit hasn't been merged
- Coordinating with team on shared branches
