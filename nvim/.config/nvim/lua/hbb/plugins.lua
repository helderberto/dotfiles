local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local _, packer = pcall(require, 'packer')

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
  use('tpope/vim-fugitive') -- Git commands in nvim
  use('tpope/vim-repeat') -- Enable repeating supported plugin maps with "."
  use('hoob3rt/lualine.nvim') -- Status line
  use('folke/which-key.nvim')
  use({
    'RRethy/vim-illuminate', -- Highlight all instances of the word under the cursor
    config = function()
      vim.g.Illuminate_delay = 100
    end,
  })
  use('github/copilot.vim')
  use('christoomey/vim-tmux-navigator') -- Seamless navigation between tmux panes and vim splits
  use({ 'akinsho/toggleterm.nvim', tag = '*' })
  use({
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
  })
  use('lewis6991/gitsigns.nvim')
  use('dinhhuy258/git.nvim') -- For git blame & browse
  use({ 'numToStr/Comment.nvim', requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  } })
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  })
  use('windwp/nvim-autopairs') -- Insert or delete brackets, parens, quotes in pair
  use('windwp/nvim-ts-autotag') -- Automatically close HTML tags
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
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' }, -- Lua utils methods shared with plugins
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-github.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
    },
  })
  use({ 'dracula/vim', as = 'dracula' })
  use('folke/zen-mode.nvim')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
