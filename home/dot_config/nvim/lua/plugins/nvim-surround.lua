return {
  'kylechui/nvim-surround',
  version = '*',
  init = function()
    vim.g.nvim_surround_no_mappings = true
  end,
  keys = {
    { '<leader>sa', '<Plug>(nvim-surround-normal)', mode = 'n' },
    { '<leader>ss', '<Plug>(nvim-surround-visual)', mode = 'x' },
    { '<leader>sS', '<Plug>(nvim-surround-visual-line)', mode = 'x' },
    { '<leader>sd', '<Plug>(nvim-surround-delete)', mode = 'n' },
    { '<leader>sc', '<Plug>(nvim-surround-change)', mode = 'n' },
  },
  config = function()
    require('nvim-surround').setup({
      aliases = {
        ['i'] = ']',
        ['r'] = ')',
        ['b'] = '}',
      },
      move_cursor = false,
    })
  end,
}
