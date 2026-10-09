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

### 1. On the old Mac

Save to 1Password: Raycast export (Settings → Advanced → Export), `~/.private`, Shottr license.

### 2. Install

Sign in to the App Store first. `brew bundle` needs it for App Store apps.

```bash
xcode-select --install
git clone https://github.com/helderberto/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./bootstrap.sh
```

Existing dotfiles in `~` get overwritten.

### 3. What you get

| Area | Result |
| ---- | ------ |
| Packages | All of `Brewfile`: CLI tools, apps, fonts, App Store apps, VSCode extensions |
| Ghostty | Catppuccin Mocha, JetBrainsMono Nerd Font, split keybinds |
| Shell | zsh, Powerlevel10k prompt, autosuggestions, syntax highlighting, fzf, z |
| Neovim | Full config, plugins install on first launch |
| VSCode | Settings, keybindings, extensions |
| Git | Config, aliases, global ignore, commit template |
| Runtimes | asdf versions from `.tool-versions` |
| Claude Code | Native install, `CLAUDE.md`, rules, statusline script |
| macOS | Dock, key repeat, scrolling, Finder, no `.DS_Store` on shares, `~/workspace/labs`, SSH key |

### 4. Finish

1. Open a new terminal.
2. [Add the SSH key to GitHub](https://github.com/settings/ssh/new) and trust the host with `ssh -T git@github.com`. Git rewrites GitHub HTTPS URLs to SSH, so clones fail until this is done.
3. Install runtimes, which failed before the key existed:
   ```bash
   cut -d' ' -f1 ~/.tool-versions | xargs -n1 asdf plugin add; asdf install
   ```
4. In `tmux`, press `prefix + I` to install plugins.

| App | Step |
| --- | ---- |
| Claude Code | Log in, recreate `~/.claude/settings.json`, `/plugin marketplace add helderberto/agent-skills` |
| Claude desktop | Download from https://claude.ai/download |
| Raycast | Turn off Spotlight `⌘ Space` in Keyboard Shortcuts, import the export |
| Shottr | Allow Screen Recording, enter license |
| Chrome, Todoist, Slack, Obsidian, Spotify, 1Password | Sign in |
| `~/.private` | Restore from 1Password |

Work tools stay out of this repo. Set them up on the work Mac.

---

<details>
<summary><strong>Day-to-day usage</strong></summary>

### Making updates

Edit in `~/.dotfiles`, then apply and push:

```bash
chezmoi apply
git add <file> && git commit -m "..." && git push
```

- New app or CLI tool → add it to `Brewfile`
- New VSCode extension → add `vscode "<id>"` to `Brewfile`
- New runtime version → edit `dot_tool-versions`
- App rewrote a managed file (VSCode settings, `p10k configure`) → `chezmoi re-add`

`chezmoi apply` reruns `brew bundle` or `asdf install` when those files change.

### Machine-specific config

`~/.private` is not managed. Put machine-only env vars and secrets there. The shell sources it.

```bash
export WORK_API_KEY=...
alias workspace="cd ~/my-company/workspace"
```

### Chezmoi reference

| Command | Purpose |
| ------- | ------- |
| `chezmoi status` | Show drift between `~` and the repo |
| `chezmoi diff` | Preview changes |
| `chezmoi apply` | Apply dotfiles to `~` |
| `chezmoi managed` | List managed paths |

</details>

<details>
<summary><strong>Development</strong></summary>

```bash
./test-chezmoi.sh              # syntax & config checks
./test-chezmoi.sh --post-apply # also validates installed tools
```

CI runs the suite on every push and PR.

`AGENTS.md` holds the agent instructions. `~/.claude/CLAUDE.md` imports it. Skills live in [helderberto/agent-skills](https://github.com/helderberto/agent-skills).

</details>

---

MIT License © [helderberto](https://github.com/helderberto)
