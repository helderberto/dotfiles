# Claude Code Configuration

Custom configuration for Claude Code CLI.

## Structure

- `CLAUDE.md` - Imports `~/AGENTS.md`, the shared agent instructions
- `rules/` - Path-scoped conventions loaded only when matching files are read (TypeScript, testing, e2e, security, a11y)
- `statusline.sh` - Status line script; the install script wires it in `settings.json`
- `settings.json` - Not managed. The install script merges the repo's `claude-settings.json` once per seed change. Existing values win and deny rules combine, so machine and work settings stay local
- Skills - See [helderberto/agent-skills](https://github.com/helderberto/agent-skills)
