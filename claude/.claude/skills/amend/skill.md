Base directory for this skill: /Users/hberto/.claude/skills/amend

# Amend Commit

## Context

Stage changes and amend the previous commit without pushing.

## Workflow

1. Check git status
2. Stage specified files (or all with `-a`)
3. Amend previous commit:
   - Use `--no-edit` to keep message
   - Or allow editing if requested
4. Show amended commit

## Rules

- Check working directory is clean or has changes
- Verify not on detached HEAD
- Warn if commit has already been pushed to remote
- Never amend commits on main/master unless explicitly requested
- Show git log after amending

## Usage Examples

```bash
/amend file1.ts file2.tsx
/amend -a
/amend -e file.ts  # Edit commit message
```
