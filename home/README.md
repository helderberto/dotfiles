# Chezmoi Source Directory

This directory contains the source files for chezmoi-managed dotfiles.

## Structure

```
chezmoi/
├── .chezmoi.toml.tmpl       # Config (editor, data)
├── .chezmoiignore           # Files to never manage
├── dot_*                    # Files mapped to ~ (e.g., dot_zshrc → ~/.zshrc)
├── run_once_before_*        # Scripts that run once, before dotfiles are applied
├── run_once_after_*         # Scripts that run once, after dotfiles are applied
└── README.md                # This file
```

## Naming Convention

- `dot_` → `.` (e.g., `dot_zshrc` → `.zshrc`)
- `executable_` → chmod +x
- `.tmpl` suffix → Process as Go template
- `run_once_` → Run script once (tracked by content hash)

## Testing Commands

```bash
# From repo root
export CHEZMOI_SOURCE_PATH="$PWD/chezmoi"

# See what would change (dry-run)
chezmoi diff --source "$CHEZMOI_SOURCE_PATH"

# Preview apply
chezmoi apply --dry-run --verbose --source "$CHEZMOI_SOURCE_PATH"

# See state
chezmoi data --source "$CHEZMOI_SOURCE_PATH"
```

## Safety

- Always use `--dry-run` first
- Never commit secrets or work data
- Check git diff before committing
- Use `.chezmoiignore` liberally
