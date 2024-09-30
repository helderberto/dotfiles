return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      size = 20, -- Size of the terminal (height for horizontal, width for vertical)
      open_mapping = [[<C-\>]], -- Default keybinding to toggle the terminal
      hide_numbers = true, -- Hide the line numbers in the terminal buffers
      shade_terminals = true, -- Apply background shading to terminal
      shading_factor = 2, -- The degree by which to darken the terminal background
      start_in_insert = true, -- Start terminal in insert mode
      insert_mappings = true, -- Whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- Whether or not the open mapping applies in terminal mode
      persist_size = true, -- Remember the size when you reopen a terminal
      direction = 'horizontal', -- Can be 'vertical', 'horizontal', 'tab', or 'float'
      close_on_exit = true, -- Automatically close the terminal window when the process exits
      shell = 'zsh', -- The shell to use
    })

    -- Keybindings

    -- Normal mode: Toggle terminal
    vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })

    -- Terminal mode: Escape from terminal to normal mode
    vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

    -- Terminal mode: Navigate to the next terminal
    vim.api.nvim_set_keymap(
      't',
      '<C-n>',
      [[<C-\><C-n>:ToggleTerm direction=tab<CR>]],
      { noremap = true, silent = true }
    )

    -- Terminal mode: Close the terminal
    vim.api.nvim_set_keymap('t', '<C-x>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
  end,
}
