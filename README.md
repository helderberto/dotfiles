# Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

**Already using these?** `chezmoi update && chezmoi apply`

---

## New Machine

Back up existing dotfiles first (e.g. `~/.zshrc`) — they will be overwritten.

**Prerequisites** (run once, requires GUI prompt):

```bash
xcode-select --install
```

**Then — one command:**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply helderberto/dotfiles
```

This installs chezmoi, pulls the repo, and applies everything: Homebrew, packages, apps, asdf with nodejs, SSH key generation, and Dock config.

After it finishes:

1. Open a **new terminal** so shell config and tools are loaded.
2. Add the generated SSH key to GitHub: https://github.com/settings/ssh/new

> If you plan to edit these dotfiles, clone the repo first:
> ```bash
> git clone git@github.com:helderberto/dotfiles.git ~/.dotfiles
> cd ~/.dotfiles && ./bootstrap.sh
> ```

---

<details>
<summary><strong>Day-to-day usage</strong></summary>

### Syncing

```bash
chezmoi update && chezmoi apply
```

### Making updates

Edit files in your clone, push, then apply:

```bash
cd ~/.dotfiles
git add <file> && git commit -m "..." && git push
chezmoi apply
```

On other machines, `chezmoi update && chezmoi apply` is enough.

### Machine-specific config

`~/.private` is **not** managed by chezmoi. Put machine-only env vars and secrets there; your shell config sources it automatically.

```bash
# in ~/.private
export WORK_API_KEY=...
alias workspace="cd ~/my-company/workspace"
```

### Chezmoi reference

| Command | Purpose |
| ------- | ------- |
| `chezmoi managed` | List all managed paths |
| `chezmoi diff` | Preview changes before applying |
| `chezmoi apply` | Apply dotfiles to `~` |

</details>

<details>
<summary><strong>Development</strong></summary>

### Testing

```bash
./test-chezmoi.sh              # syntax & config checks
./test-chezmoi.sh --post-apply # also validates installed tools
```

CI runs the test suite on every push and PR via GitHub Actions.

### AI agent config

`AGENTS.md` is the source of truth for agent instructions. `~/.claude/CLAUDE.md` symlinks to it, so it works with Claude Code, Open Code, and other tools that look for either file.

</details>

---

MIT License © [helderberto](https://github.com/helderberto)
