return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- common
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  -- file navigation
  use {
    'lambdalisue/fern.vim', -- override netrw
    requires = {{'lambdalisue/fern-hijack.vim'}, {'antoinemadec/FixCursorHold.nvim'}},
  }

  -- search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- development
  use 'editorconfig/editorconfig-vim'
  use 'jiangmiao/auto-pairs'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- syntax (lsp)

  -- html
  use 'mattn/emmet-vim'

  -- git
  use 'tpope/vim-fugitive'

  -- coc
  use {'neoclide/coc.nvim', branch = 'release'}

  -- snippets
  use 'SirVer/ultisnips'
  use 'helderburato/aragorn-vim-snippets'

  -- visual
  use {'dracula/vim', as = 'dracula'} -- theme
  use 'hoob3rt/lualine.nvim' -- status bar
end)
