# ⚙️ Helder's Dotfiles

> My OS X setup and migration files, quickly start!

## Installation

Clone project to your machine:

```bash
git clone git://github.com/helderburato/dotfiles.git ~/.dotfiles
```

### Setting up your Mac

* Update macOS to the latest version with the App Store;
* Install Xcode from the App Store, open it and accept the license agreement;
* Install macOS Command Line Tools by running `xcode-select --install`;
* Copy your public and private SSH keys to `~/.ssh` and make sure they're set to chmod `600`;
* Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#getting-started);

**Run installer:**

```bash
./install.sh
```

### Install Homebrew formulae

Execute the `brew.sh` to install some common Homebrew formulae:

```bash
./brew.sh
```

After that, install `brew cask` packages:

```bash
./brew-cask.sh
```

## Install Mac App Store

Run the command below to install the apps:

```bash
./mac-app-store.sh
```

## Inspired by the projects

* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles);
* [Paul's dotfiles](https://github.com/paulirish/dotfiles);
* [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles);
* [Dries's Dotfiles](https://github.com/driesvints/dotfiles);

## License

This project is licensed under the MIT [License](LICENSE) - see the LICENSE file for details.
