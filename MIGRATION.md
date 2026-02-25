# Chezmoi Migration Plan

## Safety First: Work Data Protection

### .gitignore Strategy
- Never commit anything from actual $HOME
- Only commit chezmoi source files from this repo
- Keep work-specific configs in `.chezmoiignore`

### Branch Strategy
- Work on `feat/chezmoi-migration` branch
- Test locally before merging
- Use `chezmoi diff` before every apply

---

## Migration Steps

### ✅ Step 1: Preparation (COMPLETE)
- [x] Install chezmoi v2.69.4
- [x] Create feature branch `feat/chezmoi-migration`
- [x] Update .gitignore for work safety
- [x] Create migration docs

### ✅ Step 2: Initial Setup (COMPLETE)
- [x] Create `chezmoi/` directory in dotfiles repo
- [x] Add `.chezmoi.toml.tmpl` with template support
- [x] Create `.chezmoiignore` for sensitive files
- [x] Test chezmoi commands - working!
- [x] Create Makefile for easy testing

### ✅ Step 3: Migrate Git Configs (COMPLETE)
- [x] Git configs (.gitconfig, .gitignore_global, .gitattributes)
- [x] Git templates (commit message template)
- [x] Test with `chezmoi diff` - looks good!
- [ ] **READY TO APPLY** (when you decide)

### ✅ Step 4: Migrate Shell Configs (COMPLETE)
- [x] ZSH configs (.zshrc with p10k, fzf, plugins)
- [x] Aliases (.aliases - 100+ shortcuts)
- [x] Exports (.exports - env variables)
- [x] Functions (.functions - utility functions)
- [x] Dircolors (.dircolors - 708 lines)
- [x] Enhanced .chezmoiignore (excludes .private, .extra, .p10k.zsh, .fzf.zsh)
- [x] Verified .private is NOT included (safe!)

**Current Status:** Git + ZSH configs ready. Test with `make diff`. Nothing applied yet.

### ✅ Step 5: Migrate Terminal Configs (COMPLETE)
- [x] Ghostty config (default terminal - Catppuccin, vim keybinds)
- [x] Alacritty config + Catppuccin theme (backup terminal)
- [x] Tmux config (vim-style, Catppuccin status bar, tpm)
- [x] Enhanced .chezmoiignore (excludes .tmux/plugins/)

**Current Status:** Git + ZSH + Terminal configs ready. Major configs migrated!

### ✅ Step 6: Migrate Remaining Configs (COMPLETE)
- [x] EditorConfig (.editorconfig - formatting rules)
- [x] ASDF (.tool-versions - Node 22.21.0, npm 10.9.4)
- [x] Claude Code config (CLAUDE.md, agents, docs)
- [x] Nvim excluded (managed separately in ~/.config/nvim/)

**🎉 MIGRATION COMPLETE!** All dotfiles migrated to chezmoi.

### Step 4: Migrate Shell Configs (Medium Risk)
- [ ] ZSH configs (exclude .private)
- [ ] Add templates for machine-specific values
- [ ] Test in isolated shell

### Step 5: Migrate Complex Configs
- [ ] Neovim (symlink to external config)
- [ ] Terminal configs (alacritty, ghostty, tmux)
- [ ] ASDF tool versions

### Step 6: Bootstrap Scripts
- [ ] Convert osx/.default_config to run_once script
- [ ] Convert brew.sh to run_once_install-packages.sh
- [ ] Add idempotency checks

### Step 7: Testing & Validation
- [ ] Create test script that validates chezmoi state
- [ ] Document rollback procedure
- [ ] Test on clean macOS VM (optional)

### Step 8: Cutover
- [ ] Backup current symlinks
- [ ] Remove old stow symlinks
- [ ] Apply chezmoi
- [ ] Update README

---

## Commands Reference

```bash
# Dry-run (safe, shows changes)
chezmoi diff

# Preview what would be applied
chezmoi apply --dry-run --verbose

# Actually apply
chezmoi apply

# Check health
chezmoi doctor

# Edit source file
chezmoi edit ~/.zshrc

# Jump to source directory
chezmoi cd
```

---

## Rollback Plan

If something breaks:
```bash
# Go back to stow
git checkout main
cd ~/.dotfiles
./osx/tasks/symlink.sh
```
