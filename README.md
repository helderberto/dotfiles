# ⚙️ Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

---

## New Machine

Choose one of the two paths below.

---

### Option A — Clone repo first (recommended)

```bash
git clone git@github.com:helderberto/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
chezmoi apply
```

`bootstrap.sh` will:

- Install Xcode CLI tools (if missing)
- Install Oh My Zsh (if missing)
- Set zsh as default shell (if needed)
- Install chezmoi (if missing)
- Create `~/.private`
- Generate SSH key and display public key to add to GitHub (if missing)

---

### Option B — Without cloning (one command)

Run prerequisites manually:

```bash
xcode-select --install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
touch ~/.private
```

Then bootstrap with chezmoi:

```bash
chezmoi init helderberto/dotfiles --apply
```

This will automatically:

- Install Homebrew
- Install all packages and apps
- Set up asdf with nodejs
- Write all dotfiles to `~`
- Create `~/workspace`
- Configure the Dock

---

### After setup

Open a new terminal session so all tools and shell config are loaded.

If you used **Option B** (or skipped SSH during bootstrap), generate an SSH key manually:

```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
```

Then add the public key to GitHub: https://github.com/settings/ssh/new

---

## Sync Existing Machine

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

`~/.private` is intentionally **not** managed by chezmoi — add machine-specific env vars there:

```bash
alias workspace="cd ~/workspace"
export WORK_API_KEY=...
```

---

## Making Updates

After editing any dotfile in `~/.dotfiles`:

```bash
git add <file>
git commit -m "..."
git push origin main
chezmoi apply
```

---

## What's Managed

| Tool         | Destination                                               |
| ------------ | --------------------------------------------------------- |
| zsh          | `~/.zshrc`, `~/.aliases`, `~/.exports`                    |
| git          | `~/.gitconfig`, `~/.gitignore_global`, `~/.gitattributes` |
| nvim         | `~/.config/nvim/`                                         |
| tmux         | `~/.tmux.conf`                                            |
| ghostty      | `~/.config/ghostty/config`                                |
| alacritty    | `~/.alacritty.toml`                                       |
| asdf         | `~/.tool-versions`                                        |
| editorconfig | `~/.editorconfig`                                         |
| claude       | `~/.claude/`                                              |

---

## License

MIT License © [helderberto](https://github.com/helderberto)
