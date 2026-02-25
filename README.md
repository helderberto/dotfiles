# ⚙️ Helder's Dotfiles

macOS dotfiles managed with [chezmoi](https://chezmoi.io).

## New Machine Setup

### 1. Prerequisites

Accept Xcode license and set zsh as default shell:

```bash
xcode-select --install
sudo chsh -s $(which zsh)
```

### 2. Bootstrap

Install chezmoi and apply dotfiles in one command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply helderberto/dotfiles --source-path chezmoi
```

This will:
- Install Homebrew
- Install all packages from `Brewfile`
- Symlink all dotfiles to `~`
- Set up your workspace directory

### 3. Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub  # add to GitHub
```

---

## Daily Usage

```bash
make diff      # preview pending changes
make apply     # apply dotfiles
make test      # run test suite
make doctor    # chezmoi health check
```

## How Templates Work

Files ending in `.tmpl` are processed as Go templates before being written to `~`. Used to customize per machine:

- `dot_gitconfig.tmpl` — injects `name` and `email` from chezmoi data
- `.chezmoi.toml.tmpl` — detects work machines via hostname (`*work*`, `*corp*`) and switches git email

## What's Managed

| Config | File |
|--------|------|
| Shell | `~/.zshrc`, `~/.aliases`, `~/.functions`, `~/.exports` |
| Git | `~/.gitconfig`, `~/.gitignore_global`, `~/.gitattributes` |
| Terminal | `~/.config/ghostty/config`, `~/.config/alacritty/` |
| Neovim | `~/.config/nvim/` |
| tmux | `~/.tmux.conf` |
| Editor | `~/.editorconfig` |
| Tools | `~/.tool-versions` |

## Author

[Helder Burato Berto](https://github.com/helderberto)

## License

[MIT](LICENSE)
