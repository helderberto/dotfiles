# My Personal Neovim Configuration

This is my personal Neovim configuration.

The entry point of the configuration is `init.vim` you can find it on
`~/.config/nvim/init.vim`.

## Configuration Structure

### `.vim` files
- `init.vim`: autoloads all settings/files. It wont change most of the time.
  - It loads the `init.lua` as well.
- `settings.vim`: native Vim, and Neovim settings.
- `plugins.vim`: the list of installed plugins. New plugins should be added
  here.
  - It uses the [vim-plug](https://github.com/junegunn/vim-plug) plugin manager.
- `mappings.vim`: keymaps for native Vim, and Neovim.

### `.lua` files
Lua module: `./hbb`

- `hbb/init.lua`: entry point for all lua setting files.
- `hbb/colors.lua`: configure the Neovim colorscheme.
- `hbb/treesitter.lua`: enable syntax highlight for multiple languages.
- `hbb/zen-mode.lua`: settings for zen-mode plugin.
