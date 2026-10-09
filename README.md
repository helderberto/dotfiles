<h1 align="center">Helder's Dotfiles</h1>

<p align="center">
  macOS dotfiles managed with <a href="https://chezmoi.io">chezmoi</a>
  <br><br>
  <a href="https://github.com/helderberto/dotfiles/actions/workflows/ci.yml">
    <img src="https://github.com/helderberto/dotfiles/actions/workflows/ci.yml/badge.svg" alt="CI">
  </a>
</p>

**Already using these?** `chezmoi update && chezmoi apply`

---

## New Machine

### Before leaving the old Mac

- Raycast: Settings → Advanced → Export → save the `.rayconfig` to 1Password
- Copy `~/.private` content to 1Password (machine-only env vars, never committed)
- Note the Shottr license key

### 1. Prerequisites

Back up existing dotfiles first (e.g. `~/.zshrc`) — they will be overwritten.

```bash
xcode-select --install
```

Sign in to the **App Store** too — `brew bundle` installs App Store apps via `mas` and fails without it.

### 2. Clone and bootstrap

```bash
git clone https://github.com/helderberto/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./bootstrap.sh
```

### 3. What you get automatically

| Area | Result |
| ---- | ------ |
| Packages | Everything in `Brewfile`: CLI tools, apps, fonts, App Store apps, VSCode extensions |
| Ghostty | Catppuccin Mocha theme, JetBrainsMono Nerd Font, split keybinds |
| Shell | zsh + Powerlevel10k prompt (same look, `~/.p10k.zsh`), autosuggestions, syntax highlighting, fzf, z |
| Neovim | Full config; lazy.nvim installs plugins on first `nvim` launch |
| VSCode | `settings.json`, `keybindings.json`, extensions |
| Git | Config, aliases, global ignore, commit template |
| Runtimes | asdf plugins + versions from `.tool-versions` (nodejs, python) |
| Claude Code | Native install, `CLAUDE.md` → `AGENTS.md`, rules, statusline script |
| macOS | Dock apps, `~/workspace/labs`, SSH key |

### 4. Finish setup

1. Open a **new terminal** so shell config and tools are loaded.
2. Add the generated SSH key to GitHub: https://github.com/settings/ssh/new
3. Switch the remote to SSH: `git -C ~/.dotfiles remote set-url origin git@github.com:helderberto/dotfiles.git`
4. tmux: start `tmux`, press `prefix + I` to install plugins.
5. `nvim` once to let lazy.nvim install plugins.

### 5. Manual (not in repo)

| App | Step |
| --- | ---- |
| Claude Code | `claude` to log in; recreate `~/.claude/settings.json` (statusline, permissions, plugins); `/plugin marketplace add helderberto/agent-skills` |
| Claude desktop | Download from https://claude.ai/download (native, not brew) |
| Raycast | Disable Spotlight `⌘ Space` (System Settings → Keyboard → Keyboard Shortcuts → Spotlight), import `.rayconfig` |
| Shottr | Grant Screen Recording permission, enter license |
| Chrome | Sign in to sync extensions/bookmarks |
| Todoist, Slack, Obsidian, Spotify, 1Password | Sign in |
| `~/.private` | Restore from 1Password |
| Work tools | Configure on the work Mac only, never in this repo |

---

<details>
<summary><strong>Day-to-day usage</strong></summary>

### Syncing

```bash
chezmoi update && chezmoi apply
```

### Making updates

Edit files in `~/.dotfiles` and apply directly — chezmoi reads from the clone:

```bash
cd ~/.dotfiles
# edit files
chezmoi apply
git add <file> && git commit -m "..." && git push
```

On other machines, `chezmoi update && chezmoi apply` pulls and applies.

### Keeping in sync

- New app or CLI tool → add to `Brewfile`; next `chezmoi apply` reruns `brew bundle`
- New VSCode extension → add a `vscode "<id>"` line (`code --list-extensions`)
- New runtime version → edit `dot_tool-versions`; next apply reruns `asdf install`
- App rewrote a managed file (VSCode settings, `p10k configure`) → `chezmoi re-add`
- `chezmoi status` shows drift between `~` and the repo

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

Curated SDLC skills (PRD → ship) live in a separate plugin: [helderberto/agent-skills](https://github.com/helderberto/agent-skills). Install via `/plugin marketplace add helderberto/agent-skills` in Claude Code.

</details>

---

MIT License © [helderberto](https://github.com/helderberto)
