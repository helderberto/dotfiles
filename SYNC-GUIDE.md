# Syncing Dotfiles to Another Mac

Complete guide to sync your dotfiles from this work Mac to your personal Mac using chezmoi.

---

## 📋 Prerequisites

Your personal Mac needs:
- macOS (any recent version)
- Internet connection
- GitHub account access

---

## 🚀 Initial Setup (One Time)

### Step 1: Install Chezmoi on Personal Mac

```bash
# Install chezmoi
brew install chezmoi

# Or use the install script
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### Step 2: Initialize from Your Repository

```bash
# Clone and apply your dotfiles
chezmoi init --apply helderburato/dotfiles

# Or if you use SSH
chezmoi init --apply git@github.com:helderburato/dotfiles.git
```

**What this does:**
1. ✅ Clones your dotfiles repo
2. ✅ Installs Homebrew (if needed)
3. ✅ Installs all packages (brew, mas)
4. ✅ Applies all configs
5. ✅ Creates workspace directories
6. ✅ Sets up everything automatically!

---

## 🔄 Updating Dotfiles (Daily Use)

### On Work Mac (This Machine)

When you make changes:

```bash
# Edit a config
chezmoi edit ~/.zshrc

# Or edit directly and add
chezmoi add ~/.zshrc

# Push changes to GitHub
cd ~/.local/share/chezmoi
git add .
git commit -m "update zsh config"
git push
```

### On Personal Mac

Pull the latest changes:

```bash
# Pull and apply updates
chezmoi update

# Or step-by-step
chezmoi git pull
chezmoi diff    # Review changes
chezmoi apply   # Apply changes
```

---

## 🎯 What Gets Synced

### ✅ Configs (Automatic)
- Git (.gitconfig, .gitignore_global)
- ZSH (.zshrc, .aliases, .functions)
- Terminals (Ghostty, Alacritty, Tmux)
- EditorConfig
- ASDF (.tool-versions)
- Claude Code config

### ✅ Packages (Automatic - `run_once_` scripts)
- Homebrew formulae (git, neovim, fzf, etc.)
- GUI apps (Ghostty, VSCode, Cursor, 1Password, etc.)
- Mac App Store apps (Bear, Amphetamine, etc.)

### ❌ Not Synced (Protected)
- `.private` (work secrets)
- `.ssh/` keys
- Work-specific files (`*work*`, `*corp*`)
- Generated configs (.p10k.zsh, .fzf.zsh)

---

## 🔐 Machine-Specific Configs

Chezmoi automatically detects machine type using templates:

**Work Mac:**
```bash
# Automatically detected if hostname contains "work" or "corp"
email = "helder.burato@gmail.com"  # Uses personal email
```

**Personal Mac:**
```bash
# Detected as personal machine
email = "helder.burato@gmail.com"
```

To customize per-machine:
```bash
# Edit local config (not synced)
chezmoi edit-config
```

---

## 🛠️ Common Tasks

### View What Would Change
```bash
chezmoi diff
```

### Preview Updates
```bash
chezmoi git pull
chezmoi diff
```

### Apply Specific File
```bash
chezmoi apply ~/.zshrc
```

### Edit Config
```bash
# Opens in nvim, auto-commits to source
chezmoi edit ~/.zshrc
```

### Re-run Bootstrap Scripts
```bash
# Force re-run (removes state tracking)
chezmoi state delete-bucket --bucket=entryState

# Then apply again
chezmoi apply
```

---

## 📱 Workflow Example

### Scenario: Add New Alias on Work Mac

**On Work Mac:**
```bash
# 1. Edit aliases
chezmoi edit ~/.aliases

# 2. Add new alias
# alias newcmd="some command"

# 3. Save and it's auto-added to source

# 4. Commit and push
cd ~/.local/share/chezmoi
git add dot_aliases
git commit -m "add newcmd alias"
git push
```

**On Personal Mac:**
```bash
# 1. Update
chezmoi update

# 2. New alias is now available!
newcmd
```

---

## 🔧 Troubleshooting

### Chezmoi Not Finding Source

```bash
# Check source directory
chezmoi source-path

# Should be: ~/.local/share/chezmoi
# If wrong, reinit:
chezmoi init git@github.com:helderburato/dotfiles.git
```

### Merge Conflicts

```bash
# Navigate to source
chezmoi cd

# Resolve conflicts
git status
git mergetool

# Apply changes
chezmoi apply
```

### Reset Everything

```bash
# Remove all chezmoi-managed files
chezmoi purge

# Start over
chezmoi init --apply helderburato/dotfiles
```

### Skip Specific Scripts

```bash
# Don't run packages script (if already installed)
chezmoi apply --exclude=scripts
```

---

## 🎯 First Time Setup Checklist

On your **personal Mac**, after running `chezmoi init --apply`:

- [ ] Verify git config: `git config --list | grep user`
- [ ] Check ZSH: `echo $SHELL` (should be /bin/zsh)
- [ ] Test aliases: `g` (should run git)
- [ ] Open Ghostty (check theme and keybinds)
- [ ] Verify packages: `brew list`
- [ ] Check workspace: `ls ~/workspace`
- [ ] Test tmux: `tmux` (should work with custom config)

---

## 💡 Pro Tips

1. **Use `chezmoi edit`** instead of editing files directly
   - Auto-commits to source
   - Prevents forgetting to sync

2. **Preview before applying**
   ```bash
   chezmoi diff
   ```

3. **Selective apply**
   ```bash
   chezmoi apply --include=dot_zshrc
   ```

4. **Check doctor**
   ```bash
   chezmoi doctor
   ```

5. **Backup before major changes**
   ```bash
   chezmoi archive > ~/dotfiles-backup.tar.gz
   ```

---

## 🚨 Important Notes

### First Run Takes Time
- Bootstrap scripts install 50+ packages
- Expect 15-30 minutes on first `chezmoi init --apply`
- Subsequent updates are instant

### Work vs Personal
- Same dotfiles work on both!
- Protected patterns prevent work data leaks
- Templates allow customization per machine

### Manual Steps Still Needed
- SSH keys (generate manually: `ssh-keygen`)
- 1Password login
- Browser sign-ins
- GitHub authentication: `gh auth login`

---

## 📚 Resources

- Chezmoi docs: https://www.chezmoi.io/
- Your dotfiles: https://github.com/helderburato/dotfiles
- Issue tracker: Open issue on your repo

---

**Questions?** Check `SUMMARY.md` or `TESTING.md` in the repo.
