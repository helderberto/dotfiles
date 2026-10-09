# Claude Code Configuration

Custom configuration for Claude Code CLI.

## Structure

- `CLAUDE.md` - Imports `~/AGENTS.md`, the shared agent instructions
- `rules/` - Path-scoped conventions loaded only when matching files are read (TypeScript, testing, security, a11y)
- `statusline.sh` - Status line script; wire it in `settings.json`
- Skills - See [helderberto/agent-skills](https://github.com/helderberto/agent-skills)

`settings.json` is not managed: it holds machine and work specific settings.
