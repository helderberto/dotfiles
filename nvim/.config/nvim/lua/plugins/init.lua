return {
  'tpope/vim-fugitive', -- Git commands in nvim
  'tpope/vim-repeat', -- Enable repeating supported plugin maps with "."
  'nvim-lualine/lualine.nvim', -- Status line
  'folke/which-key.nvim',
  'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  {
    'RRethy/vim-illuminate', -- Highlight all instances of the word under the cursor
    config = function()
      vim.g.Illuminate_delay = 100
    end,
  },
  'github/copilot.vim',
  { 'akinsho/toggleterm.nvim', version = '*' },
  { 'kylechui/nvim-surround', version = '*' },
  'lewis6991/gitsigns.nvim',
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },
  'windwp/nvim-autopairs', -- Insert or delete brackets, parens, quotes in pair
  'windwp/nvim-ts-autotag', -- Automatically close HTML tags
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Formatting, Linting
      { 'nvimtools/none-ls.nvim' },
      { 'nvimtools/none-ls-extras.nvim' },

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
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }, -- Lua utils methods shared with plugins
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-github.nvim' },
    },
  },
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },
  'folke/zen-mode.nvim',
}
