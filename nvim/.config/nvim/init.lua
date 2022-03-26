-- [[
-- Much of the configuration of individual plugins you can find in either:
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

pcall(require, "impatient")

-- Leader key -> <Space>
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = " "

-- Base settings
require "hbb.settings"

-- Custom key mappings
require "hbb.mappings"
