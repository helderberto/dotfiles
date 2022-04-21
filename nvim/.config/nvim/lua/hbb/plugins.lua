-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim' -- Speed up loading Lua modules to improve startup time
  use 'nvim-lua/plenary.nvim' -- Lua utils methods shared with plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'hoob3rt/lualine.nvim'
  use 'mattn/emmet-vim' -- autocomplete html tags
  use 'editorconfig/editorconfig-vim'
  use 'windwp/nvim-autopairs'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'antoinemadec/FixCursorHold.nvim', -- Fix CursorHold Performance.
    run = function()
      -- https://github.com/antoinemadec/FixCursorHold.nvim
      vim.g.cursorhold_updatetime = 100
    end,
  }
  use { 'kyazdani42/nvim-tree.lua' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions

  -- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
  }
  use { 'dracula/vim', as = 'dracula' }
end)
