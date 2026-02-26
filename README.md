# ⚙️ Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

**New machine:** `./bootstrap.sh`
**Already using these dotfiles:** `chezmoi update && chezmoi apply`

---

## New Machine

You’ll overwrite existing dotfiles (e.g. `~/.zshrc`). Back up anything you care about first.

```bash
git clone git@github.com:helderberto/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

`bootstrap.sh` will:

1. Check for Xcode CLI tools — re-run if prompted to install them first
2. Install chezmoi and apply all dotfiles

That includes: Homebrew, packages, apps, asdf with nodejs, SSH key generation, and Dock config.

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

`~/.private` is **not** managed by chezmoi. Put machine-only env vars and secrets there; your shell config sources it automatically.

```bash
# in ~/.private
export WORK_API_KEY=...
alias workspace="cd ~/my-company/workspace"
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
