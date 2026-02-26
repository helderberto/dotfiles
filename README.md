# ⚙️ Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

---

## New Machine

**1. Prerequisites**

Install Xcode CLI tools:

```bash
xcode-select --install
```

Set zsh as the default shell. zsh is pre-installed on macOS Catalina+. If not available, install it first via [ohmyz.sh](https://ohmyz.sh/#install):

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Check if zsh is the default shell, if not:

```bash
sudo chsh -s $(which zsh)
```

**2. Bootstrap (one command)**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply helderberto/dotfiles
```

This will automatically:
- Install Homebrew
- Install all packages and apps
- Set up asdf with nodejs
- Bootstrap tmux plugins
- Write all dotfiles to `~`
- Create `~/workspace`
- Configure the Dock

**3. After setup**

Open a new terminal session so all tools and shell config are loaded.

Generate an SSH key and add it to GitHub:
```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
```

Create `~/.private` with machine-specific env vars:
```bash
alias workspace="cd ~/workspace"
# add any machine-specific secrets or aliases here
```

---

## Sync Existing Machine

If not already cloned:
```bash
git clone git@github.com:helderberto/dotfiles.git ~/.dotfiles
```

Then:
```bash
cd ~/.dotfiles
git pull origin main
chezmoi apply
```

Or preview first:
```bash
chezmoi diff    # preview what would change
chezmoi apply   # apply changes
```

---

## Machine-Specific Config

`~/.private` is intentionally **not** managed by chezmoi — create it manually on each machine:

```bash
# Work machine example
alias work="cd ~/work"
export WORK_API_KEY=...

# Shared with ~/.extra for secrets that should never be committed
[[ -f ~/.extra ]] && source ~/.extra
```

---

## Making Updates

After editing any dotfile in `~/.dotfiles`:

```bash
cd ~/.dotfiles
git add <file>
git commit -m "..."
git push origin main
```

Then apply to the current machine:
```bash
chezmoi apply
```

---

## What's Managed

| Tool | Destination |
|------|------------|
| zsh | `~/.zshrc`, `~/.aliases`, `~/.exports`, `~/.functions` |
| git | `~/.gitconfig`, `~/.gitignore_global`, `~/.gitattributes` |
| nvim | `~/.config/nvim/` |
| tmux | `~/.tmux.conf` |
| ghostty | `~/.config/ghostty/config` |
| alacritty | `~/.alacritty.toml` |
| asdf | `~/.tool-versions` |
| editorconfig | `~/.editorconfig` |
| claude | `~/.claude/` |

---

## Shell Prompt

The prompt config (`.p10k.zsh`) is managed by chezmoi and applied automatically. To reconfigure:

```bash
p10k configure
```

---

## Author

[Helder Burato Berto](https://github.com/helderberto) · [MIT](LICENSE)
