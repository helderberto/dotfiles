return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      size = 20, -- Terminal size (height for horizontal, width for vertical)
      open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
      hide_numbers = true, -- Hide line numbers in terminal buffers
      shade_terminals = true, -- Apply shading to terminal backgrounds
      shading_factor = 2, -- Degree of terminal background shading
      start_in_insert = true, -- Start terminal in insert mode
      insert_mappings = true, -- Enable keybinding in insert mode
      terminal_mappings = true, -- Enable keybinding in terminal mode
      persist_size = true, -- Remember terminal size between sessions
      direction = 'horizontal', -- Terminal direction: 'vertical', 'horizontal', 'tab', or 'float'
      close_on_exit = true, -- Close terminal when the process exits
      shell = vim.o.shell, -- Use the default shell configured in Neovim
    })

    -- Keybindings

    -- Normal mode: Toggle terminal
    vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })

    -- Terminal mode: Escape from terminal to normal mode
    vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
}
