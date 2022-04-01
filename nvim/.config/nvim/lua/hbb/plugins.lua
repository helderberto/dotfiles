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
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Speed up loading Lua modules in Neovim to improve startup time.
  use 'lewis6991/impatient.nvim'

  -- Load plugins
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'hoob3rt/lualine.nvim'
  use 'mattn/emmet-vim'
  use 'editorconfig/editorconfig-vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'neoclide/coc.nvim', branch = 'release' }
  -- use {
  --   "SirVer/ultisnips",
  --   requires = {"helderburato/aragorn-vim-snippets"},
  --   config = function()
  --     vim.g.UltiSnipsExpandTrigger='<Tab>'
  --     vim.g.UltiSnipsJumpForwardTrigger='<Tab>'
  --     vim.g.UltiSnipsJumpBackwardTrigger='<S-Tab>'
  --     vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
  --   end
  -- }
  use 'jiangmiao/auto-pairs'
  use {
    'lambdalisue/fern.vim',
    requires = {
      'lambdalisue/fern-hijack.vim',
      {
        'antoinemadec/FixCursorHold.nvim',
        run = function()
          -- https://github.com/antoinemadec/FixCursorHold.nvim#configuration
          -- in millisecond, used for both CursorHold and CursorHoldI,
          -- use updatetime instead if not defined
          vim.g.cursorhold_updatetime = 100
        end
      }
    },
    config = function()
      vim.g['fern#default_hidden'] = true
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    }
  }
  use {'dracula/vim', as = 'dracula'} -- theme
end)
