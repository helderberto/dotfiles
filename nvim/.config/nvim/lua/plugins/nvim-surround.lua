return {
  'kylechui/nvim-surround',
  version = '*',
  config = function()
    require('nvim-surround').setup({
      keymaps = {
        normal = '<leader>sa', -- Surround with something
        normal_cur = false,
        normal_line = false,
        normal_cur_line = false,
        visual = '<leader>ss', -- Surround selected text
        visual_line = '<leader>sS', -- Surround selected line
        delete = '<leader>sd', -- Delete surrounding
        change = '<leader>sc', -- Change surrounding (using 'c' instead of 'r' to avoid confusion)
      },
      aliases = {
        ['i'] = ']', -- Index
        ['r'] = ')', -- Round
        ['b'] = '}', -- Brackets
      },
      move_cursor = false,
    })
  end,
}
