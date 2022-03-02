# ⚙️ Helder's Dotfiles

My base settings for when I start in a new environment.

## Requirements

Set zsh as your default shell:

```bash
sudo chsh -s $(which zsh)
```

## Setting up your Mac

- Update macOS to the latest version with the App Store;
- Install Xcode from the App Store, open it and accept the license agreement;

## Install

- Clone onto your machine:

```bash
git clone git://github.com/helderburato/dotfiles.git ~/.dotfiles
```

- Install the dotfiles:

```bash
sh ~/.dotfiles/install.sh
```

## fzf

To enable the FZF in command line you need to follow [this guide](https://github.com/junegunn/fzf#installation).

_Note: It's already added to the .bashrc just need to install the package_

## Neovim

[Read more](./nvim/.config/nvim/README.md) about my Neovim configuration project structure.

### After Install

Restart your computer and enjoy your new configuration. ✌🏻

## Generate the SSH Keys

It's required to generate in every machine you start.

- Go to your $HOME with `cd ~`;
- Generate the new key `ssh-keygen`;

## Troubleshoot

### Antigen

If you get any problems with `antigen`, try `rm -rf ~/.antigen` after complete, close your terminal and open again to reinstall the packages from antigen.

### Homebrew

If you get any permissions problems when trying to run `brew` scripts, try to give the following permissions to your current user:
```bash
$ sudo chown -R $(whoami):admin /usr/local && sudo chmod -R g+rwx /usr/local
```

## Author

| [![Helder B. Berto](https://avatars3.githubusercontent.com/u/862575?v=3&s=80)](https://github.com/helderburato) |
| ----------------------------------------------------------------------------------------------------- |
| [Helder B. Berto](https://helderburato.com)                                                              |

## Inspiration

- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles);
- [Cătălin Mariș dotfiles](https://github.com/alrra/dotfiles);
- [Paul's dotfiles](https://github.com/paulirish/dotfiles);
- [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles);
- [Dries's Dotfiles](https://github.com/driesvints/dotfiles);

## License

[MIT License](LICENSE) © Helder Burato Berto
