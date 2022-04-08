-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
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
  use 'hoob3rt/lualine.nvim'
  use 'mattn/emmet-vim' -- autocomplete html tags
  use 'editorconfig/editorconfig-vim'
  use 'windwp/nvim-autopairs'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'antoinemadec/FixCursorHold.nvim', -- Fix CursorHold Performance.
    run = function()
      -- https://github.com/antoinemadec/FixCursorHold.nvim
      vim.g.cursorhold_updatetime = 100
    end
  }
  use {
    'lambdalisue/fern.vim',
    requires = {'lambdalisue/fern-hijack.vim'},
    config = function()
      vim.g['fern#default_hidden'] = true
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}}
  }
  use {'dracula/vim', as = 'dracula'}
end)
