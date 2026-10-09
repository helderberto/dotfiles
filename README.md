<h1 align="center">Helder's Dotfiles</h1>

<p align="center">
  macOS dotfiles managed with <a href="https://chezmoi.io">chezmoi</a>
  <br><br>
  <a href="https://github.com/helderberto/dotfiles/actions/workflows/ci.yml">
    <img src="https://github.com/helderberto/dotfiles/actions/workflows/ci.yml/badge.svg" alt="CI">
  </a>
</p>

**Already using these?** `chezmoi update`

---

## New Machine

### 1. Before leaving the old Mac

Check the repo has everything:

```bash
chezmoi status                                   # managed files edited outside the repo → chezmoi re-add
brew bundle cleanup --file ~/.dotfiles/Brewfile  # installed but not in Brewfile → add or ignore
```

Never pass `--force` to `cleanup`. It uninstalls everything unlisted, including Apple's apps.

Save these to 1Password:

- Raycast settings: Settings → Advanced → Export (`.rayconfig` file)
- `~/.private`
- `~/.claude/settings.json` (Claude Code permissions, plugins, statusline)
- Shottr license key

### 2. Install

First, open the App Store and sign in. App Store apps fail to install without it.

Then open Terminal and run each command **one at a time**. Wait for each to finish. Pasting them together breaks the Homebrew installer, which reads your password and an Enter keypress.

1. Install Homebrew. It also installs the Xcode Command Line Tools.
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Load Homebrew in this Terminal session.
   ```bash
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```
3. Install chezmoi.
   ```bash
   brew install chezmoi
   ```
4. Clone this repo to `~/.dotfiles` and apply everything. Existing dotfiles in `~` get overwritten.
   ```bash
   chezmoi init --apply --source ~/.dotfiles helderberto
   ```
   This takes a while. It stops to ask for your password (some apps need it) and an email for the new SSH key.

### 3. What you get

| Area | Result |
| ---- | ------ |
| Packages | All of `Brewfile`: CLI tools, apps, fonts, App Store apps |
| Ghostty | Catppuccin Mocha, JetBrainsMono Nerd Font, split keybinds |
| Shell | zsh, Powerlevel10k prompt, autosuggestions, syntax highlighting, fzf, z |
| Neovim | Full config, plugins install on first launch |
| Git | Config, aliases, global ignore, commit template |
| Runtimes | asdf versions from `.tool-versions` |
| Claude Code | Native install, `CLAUDE.md`, rules, statusline script |
| macOS | Dock, key repeat, scrolling, Finder, no `.DS_Store` on shares, `~/workspace/labs`, SSH key |

### 4. Finish in Ghostty

Close Terminal and open Ghostty. Your shell config loads from here on.

Add your SSH key to GitHub. Git pushes to GitHub over SSH.

```bash
pbcopy < ~/.ssh/id_ed25519.pub   # paste at https://github.com/settings/ssh/new
ssh -T git@github.com            # answer "yes" to trust GitHub
```

### 5. Set up apps

These need a login or a manual step:

| App | Step |
| --- | ---- |
| Claude Code | Run `claude` and log in. Restore `~/.claude/settings.json` from 1Password. Run `/plugin marketplace add helderberto/agent-skills` |
| Raycast | Turn off Spotlight's `⌘ Space` (System Settings → Keyboard → Keyboard Shortcuts → Spotlight). Import the `.rayconfig` |
| Shottr | Allow Screen Recording. Enter the license key |
| VSCode | Turn on Settings Sync. It restores settings and extensions |
| Claude, Chrome, Todoist, Slack, Obsidian, Spotify, 1Password | Sign in |
| `~/.private` | Restore from 1Password |

Work tools stay out of this repo. Set them up on the work Mac.

## Existing Mac

Adds what's missing. Preview first: `~` may hold edits you want to keep.

1. Clone without applying.
   ```bash
   brew install chezmoi
   chezmoi init --source ~/.dotfiles helderberto
   ```
2. Preview changes to `~`. Move machine-only bits to `~/.private` first.
   ```bash
   chezmoi diff
   ```
3. Sign in to the App Store, then apply. `brew bundle` installs only what's missing.
   ```bash
   chezmoi apply
   ```
4. Do [steps 4 and 5](#4-finish-in-ghostty) for anything not set up yet.

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
- New runtime version → edit `dot_tool-versions`
- App rewrote a managed file (`p10k configure`) → `chezmoi re-add`

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
