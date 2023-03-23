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
  use('lewis6991/impatient.nvim')      -- Speed up loading Lua modules to improve startup time
  use('tpope/vim-fugitive')            -- Git commands in nvim
  use('tpope/vim-repeat')              -- Enable repeating supported plugin maps with "."
  use('tpope/vim-surround')            -- Easily delete/change/add surroundings in pairs
  use('hoob3rt/lualine.nvim')          -- Status line
  use('editorconfig/editorconfig-vim') -- EditorConfig support
  use('windwp/nvim-autopairs')         -- Insert or delete brackets, parens, quotes in pair
  use({ 'github/copilot.vim', branch = 'release' })
  use({
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use('prisma/vim-prisma')
  use({
    'RRethy/vim-illuminate', -- Highlight all instances of the word under the cursor
    config = function()
      vim.g.Illuminate_delay = 100
    end,
  })
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })

  -- Markdown Preview
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  -- File Explorer
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
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

  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Formatting, Linting
      { 'jose-elias-alvarez/null-ls.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

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

  use('folke/zen-mode.nvim')
end)
