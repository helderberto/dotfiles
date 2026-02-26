# ⚙️ Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

**New machine:** `./bootstrap.sh` then `chezmoi init helderberto/dotfiles --apply`  
**Already using these dotfiles:** `chezmoi update && chezmoi apply`

---

## New Machine

You’ll overwrite existing dotfiles (e.g. `~/.zshrc`). Back up anything you care about first.

Choose one path below.

---

### Option A — Clone first (recommended if you’ll edit the dotfiles)

Clone [helderberto/dotfiles](https://github.com/helderberto/dotfiles), bootstrap, then point chezmoi at the remote repo:

```bash
git clone git@github.com:helderberto/dotfiles.git ~/.dotfiles   # or any path you prefer
cd ~/.dotfiles
./bootstrap.sh
chezmoi init helderberto/dotfiles --apply
```

`bootstrap.sh` installs (if missing):

- Xcode CLI tools — you may need to re-run the script after they finish
- Oh My Zsh
- zsh as default shell
- chezmoi

`chezmoi init helderberto/dotfiles --apply` will:

- Create `~/.private`
- Generate SSH key (prompts for email on first run)
- Write all dotfiles and run setup scripts (Homebrew, asdf, Dock, etc.)

---

### Option B — One command (no clone)

Use this if you don’t need the repo on disk. Run the prerequisites below first, then one chezmoi command.

**Prerequisites** (run once):

```bash
xcode-select --install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
touch ~/.private   # so runscripts that expect this file don’t fail
```

**Then:**

```bash
chezmoi init helderberto/dotfiles --apply
```

That will:

- Install Homebrew, packages, and apps
- Set up asdf with nodejs
- Write all dotfiles and create `~/workspace`
- Configure the Dock

---

### After setup

1. Open a **new terminal** so shell config and tools are loaded.
2. Add the generated SSH key to GitHub: https://github.com/settings/ssh/new

---

## Sync Existing Machine

Pull the latest from the repo and apply:

```bash
chezmoi update
chezmoi diff    # optional: preview changes
chezmoi apply
```

---

## Machine-Specific Config

`~/.private` is **not** managed by chezmoi. Put machine-only env vars and aliases there; your shell config sources it.

```bash
# in ~/.private
alias workspace="cd ~/workspace"
export WORK_API_KEY=...
```

---

## Making Updates

Edit the dotfiles in your clone of **helderberto/dotfiles**, push, then apply:

```bash
cd ~/.dotfiles   # or wherever you cloned the repo
git add <file>
git commit -m "..."
git push origin main
chezmoi apply
```

On other machines, `chezmoi update && chezmoi apply` is enough.

---

## Reference

| Command | Purpose |
| ------- | ------- |
| `chezmoi managed` | List all managed paths |
| `chezmoi diff` | Preview changes before applying |
| `chezmoi apply` | Apply dotfiles to `~` |

---

## License

MIT License © [helderberto](https://github.com/helderberto)
