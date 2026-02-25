# Testing Chezmoi Safely

## Current State
- ✅ Your dotfiles still use **stow** (all symlinks intact)
- ✅ Chezmoi is installed and configured
- ✅ All configs migrated to `chezmoi/` directory
- ✅ Comprehensive test suite added
- ✅ GitHub Actions CI configured
- ⏸️ **Nothing applied yet** - safe testing mode

## Test Suite Overview

### Pre-Apply Tests
- `make test` - Full test suite (recommended)
- `make test-quick` - Quick validation
- `make diff` - Preview changes
- `make dry-run` - Detailed preview

### Post-Apply Tests
- `validate-setup.sh` - Runs automatically after apply
- Validates git, shell, aliases, tools

### CI Tests
- GitHub Actions runs on push/PR
- Tests on macOS runner
- Validates templates and secrets

## How to Test

### 1. See what would change (safe)
```bash
make diff
```
This shows exact changes chezmoi would make. No modifications.

### 2. Dry-run (safer)
```bash
make dry-run
```
Shows detailed preview of all operations. Still no changes.

### 3. Check configuration
```bash
make test
```
Validates chezmoi setup and shows your config data.

### 4. Actually apply (when ready)
```bash
make apply
```
⚠️ This will:
- Replace git symlinks with actual files
- Same content, just files instead of symlinks
- Your configs remain identical

## Safety Notes

### What's Protected
- `.zsh/.private` - gitignored, won't be committed
- `~/.config/chezmoi/chezmoi.toml` - local only, gitignored
- Work-specific patterns (`*work*`, `*corp*`) - gitignored
- Secrets/credentials - blocked by gitignore

### Rollback Plan
If you apply and want to revert:
```bash
# Remove chezmoi-managed files
chezmoi purge

# Restore stow symlinks
cd ~/.dotfiles
./osx/tasks/symlink.sh
```

### What Gets Committed
Only files in `~/.dotfiles/chezmoi/`:
- Templates (`.tmpl` files)
- Source configs (public settings only)
- Documentation

Your actual `~/.gitconfig`, `~/.zshrc`, etc. are NEVER committed.

## Next Steps

When you're ready to apply git configs:
1. Run `make diff` one more time
2. Verify output looks correct
3. Run `make apply`
4. Test: `git config --list | grep user`

Current migration only affects:
- `~/.gitconfig`
- `~/.gitattributes`
- `~/.gitignore_global`
- `~/.gittemplates/commit`

Everything else (zsh, nvim, etc.) stays with stow for now.
