# ⚙️ Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

---

## New Machine

**1. Prerequisites**

zsh is pre-installed on macOS Catalina+. If not available, install it first: [ohmyz.sh](https://ohmyz.sh/#install) or `brew install zsh`.

```bash
xcode-select --install
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

Run `p10k configure` to set up your shell prompt.

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
make apply
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
make apply
```

Or just:
```bash
make diff    # preview what would change
make apply   # apply changes
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

## Author

[Helder Burato Berto](https://github.com/helderberto) · [MIT](LICENSE)
