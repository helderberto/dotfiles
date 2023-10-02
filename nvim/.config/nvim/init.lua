-- Helder Berto
-- https://helderberto.com
-- https://github.com/helderberto/dotfiles

pcall(require, 'impatient') -- Speed up loading time
require('hbb.disable_built_in') -- Disable built-in plugins
require('hbb.settings') -- Define global settings
require('hbb.keymaps') -- Define global keymaps
require('hbb.autocommands') -- Define global autocommands
require('hbb.plugins') -- Load plugins
