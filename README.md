# ⚙️ Helder's Dotfiles

My base settings for when I start in a new environment.

## Requirements

Set zsh as your login shell:

```bash
sudo chsh -s $(which zsh) <your-username>
```

## Setting up your Mac

- Update macOS to the latest version with the App Store;
- Install Xcode from the App Store, open it and accept the license agreement;
- Copy your public and private SSH keys to `~/.ssh` and make sure they're set to chmod `600`;

## Installation

- Clone onto your machine:

```bash
git clone git://github.com/helderburato/dotfiles.git ~/.dotfiles
```

- Install the dotfiles:

```bash
sh ~/.dotfiles/install.sh
```

Restart your computer and enjoy your new configuration.! ✌🏻

## Inspiration

- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles);
- [Cătălin Mariș dotfiles](https://github.com/alrra/dotfiles);
- [Paul's dotfiles](https://github.com/paulirish/dotfiles);
- [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles);
- [Dries's Dotfiles](https://github.com/driesvints/dotfiles);

## License

This project is licensed under the MIT [License](LICENSE) - see the LICENSE file for details.
