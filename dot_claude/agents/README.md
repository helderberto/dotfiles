# Claude Code Agents

## Available Agents

| Agent | Purpose |
|-------|---------|
| `security-auditor` | Threat modeling, OWASP, vulnerability assessment |
| `test-auditor` | Test effectiveness beyond coverage |
| `learner` | Capture insights into CLAUDE.md |
| `git-detective` | Investigate git history and trace changes |
| `frontend-architect` | Component design, deep modules, structural health |
| `parity-check` | Audit code migrations for missing functionality |

## Usage Examples

**parity-check** — requires source path, target path, and scope:
```
Use parity-check: source=src/legacy target=src/v2 scope="user profile form"
```

## Design Principles

1. **Clear purpose**: Well-defined scope, no overlap
2. **Concise**: Minimal context cost, maximum signal
3. **Actionable**: Checklists, not essays
