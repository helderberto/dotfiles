-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

return packer.startup(function(use)
  use('wbthomason/packer.nvim')
  use('lewis6991/impatient.nvim') -- Speed up loading Lua modules to improve startup time
  use('tpope/vim-fugitive') -- Git commands in nvim
  use('tpope/vim-repeat') -- Enable repeating supported plugin maps with "."
  use('tpope/vim-surround') -- Easily delete/change/add surroundings in pairs
  use('tpope/vim-commentary') -- Comment stuff out
  use('hoob3rt/lualine.nvim') -- Status line
  use('editorconfig/editorconfig-vim') -- EditorConfig support
  use('windwp/nvim-autopairs') -- Insert or delete brackets, parens, quotes in pair
  use({ 'github/copilot.vim', branch = 'release' })

  -- Markdown Preview
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  })

  -- Treesitter Syntax Highlighting
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      {
        'windwp/nvim-ts-autotag',
        config = function()
          require('nvim-ts-autotag').setup()
        end,
      },
    },
  })

  -- LSP - Language Server Protocol
  use({
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    requires = {
      -- LSP
      { 'williamboman/nvim-lsp-installer' },

      -- Formatting, Linting
      { 'jose-elias-alvarez/null-ls.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- The completion plugin
      { 'hrsh7th/cmp-buffer' }, -- buffer completion
      { 'hrsh7th/cmp-path' }, -- path completions
      { 'hrsh7th/cmp-cmdline' }, -- cmdline completions
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' }, -- snippet completions

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  })

  -- Telescope - Fuzzy Finder
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' }, -- Lua utils methods shared with plugins
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-github.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
    },
  })

  -- Theme
  use({ 'dracula/vim', as = 'dracula' })
end)
