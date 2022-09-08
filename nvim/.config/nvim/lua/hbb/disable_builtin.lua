-- Vim (and therefore neovim) come with a wide variety of builtin plugins to
-- handle a wide variety of things. Netrw (the builtin file explorer) is
-- probably the most widely known/used, but there are many others. These affect
-- the startup time of (n)vim, so some people elect to disable them!
--
-- These global vars are checked at the beginning of these plugins being
-- loaded, and if they're truthy (i.e in vimscript, equal to 1) the plugin is
-- deemed to have been already loaded, and thus the rest of it's setup is
-- skipped. e.g
-- https://github.com/vim/vim/blob/3fcccf94e8bc142d2c79c3b62087145896df6b36/runtime/autoload/getscript.vim#L15

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
