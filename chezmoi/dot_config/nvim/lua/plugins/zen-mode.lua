return {
  'folke/zen-mode.nvim',

  config = function()
    vim.keymap.set('n', '<leader>zz', function()
      require('zen-mode').setup({
        window = {
          width = 120,
          options = {},
        },
      })
      require('zen-mode').toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
    end, { desc = 'Zen mode with line numbers' })

    vim.keymap.set('n', '<leader>zZ', function()
      require('zen-mode').setup({
        window = {
          width = 120,
          options = {},
        },
      })
      require('zen-mode').toggle()
      vim.wo.wrap = false
      vim.wo.number = false
      vim.wo.rnu = false
      vim.opt.colorcolumn = '0'
    end, { desc = 'Zen mode without line numbers' })
  end,
}
