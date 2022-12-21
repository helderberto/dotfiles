-- Helder Berto
-- https://helderberto.com
-- https://github.com/helderberto
--
--
-- [[ Notes to people reading my configuration!
--
-- Much of the configuration of individual plugins you can find in either:
--
-- ./plugin/*.lua
-- This is where many of the new plugin configurations live.
--
-- ./after/plugin/*.vim
-- This is where configuration for plugins live.
--
-- They get auto sourced on startup. In general, the name of the file configures
-- the plugin with the corresponding name.
--
-- ./lua/hbb/*.lua
-- This is where configuration/extensions for new style plugins live.
--
-- They don't get sourced automatically, but do get sourced by doing something like:
-- require('hbb.treesiter')
--
-- or similar. I generally recommend that people do this so that you don't accidentally
-- override any of the plugin requires with namespace clashes. So don't just put your configuration
-- in "./lua/treesitter.lua" because then it will override the plugin version of "treesitter.lua"
-- ]]

pcall(require, 'impatient')

if require 'hbb.first_load'() then
  return
end

-- Leader key -> <Space>
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Settings.lua contains all global options that are set. Most of these will
-- should have a description. This has to come first, since it defines the
-- mapleader, and many many other keymappings require that to be set.
require 'hbb.settings'

-- Defines a list of plugins to pull down and use, as well as their
-- configurations.
require 'hbb.plugins'

-- Defines global keymaps. `:h vim.keymap` and `:h map` to learn more!
require 'hbb.mappings'

-- Neovim built-in LSP
require 'hbb.lsp'

-- Autocomplete
require 'hbb.cmp'
