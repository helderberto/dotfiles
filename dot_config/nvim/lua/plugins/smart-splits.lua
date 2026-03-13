return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    require('smart-splits').setup({
      multiplexer_integration = false,
    })

    vim.keymap.set({ 'n', 't' }, '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Go to left window' })
    vim.keymap.set({ 'n', 't' }, '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Go to lower window' })
    vim.keymap.set({ 'n', 't' }, '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Go to upper window' })
    vim.keymap.set({ 'n', 't' }, '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Go to right window' })
  end,
}
