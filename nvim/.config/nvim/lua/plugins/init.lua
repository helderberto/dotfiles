return {
  'tpope/vim-repeat', -- Enable repeating supported plugin maps with "."
  'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  {
    'RRethy/vim-illuminate', -- Highlight all instances of the word under the cursor
    config = function()
      vim.g.Illuminate_delay = 100
    end,
  },
  'github/copilot.vim',
  { 'akinsho/toggleterm.nvim', version = '*' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  'windwp/nvim-autopairs', -- Insert or delete brackets, parens, quotes in pair
  'windwp/nvim-ts-autotag', -- Automatically close HTML tags
}
