-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)
local cmd = vim.cmd -- Execute Vim commands

local download_packer = function()
  if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then
    return
  end

  local directory = string.format('%s/site/pack/packer/start/', vim.fn.stdpath('data'))

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(
    string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim')
  )

  print(out)
  print('Downloading packer.nvim...')
  print("( You'll need to restart now )")
end

-- Commands
cmd([[command! WhatHighlight :call util#syntax_stack()]])
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

cmd([[
  augroup packer_auto_compile
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup END
]])

-- Disable nvim intro
opt.shortmess:append('sI')

-- Disable builtin plugins
local disabled_built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
}

for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end

return function()
  if not pcall(require, 'packer') then
    download_packer()

    return true
  end

  return false
end
