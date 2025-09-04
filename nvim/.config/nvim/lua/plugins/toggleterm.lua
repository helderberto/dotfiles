return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      -- Dynamic sizing based on direction
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]], -- Main toggle keybinding
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'horizontal', -- Default direction
      close_on_exit = true,
      shell = vim.o.shell,
      -- Float terminal configuration
      float_opts = {
        border = 'curved',
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        winblend = 10,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    })

    -- Useful keybindings for different terminal layouts
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Main toggle
    keymap('n', '<C-\\>', '<cmd>ToggleTerm<CR>', opts)

    -- Terminal directions
    keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Terminal horizontal' })
    keymap('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Terminal vertical' })
    keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Terminal float' })

    -- Multiple terminals
    keymap('n', '<leader>1', '<cmd>1ToggleTerm<CR>', { desc = 'Terminal 1' })
    keymap('n', '<leader>2', '<cmd>2ToggleTerm<CR>', { desc = 'Terminal 2' })
    keymap('n', '<leader>3', '<cmd>3ToggleTerm<CR>', { desc = 'Terminal 3' })

    -- Send to terminal
    keymap('n', '<leader>ts', '<cmd>ToggleTermSendCurrentLine<CR>', { desc = 'Send line to terminal' })
    keymap('v', '<leader>ts', '<cmd>ToggleTermSendVisualSelection<CR>', { desc = 'Send selection to terminal' })

    -- Custom terminal functions
    local Terminal = require('toggleterm.terminal').Terminal

    -- Node REPL
    local node = Terminal:new({ cmd = 'node', hidden = true })
    function _NODE_TOGGLE()
      node:toggle()
    end
    keymap('n', '<leader>tn', '<cmd>lua _NODE_TOGGLE()<CR>', vim.tbl_extend('force', opts, { desc = 'Node REPL' }))

    -- Terminal management commands
    keymap(
      'n',
      '<leader>ta',
      '<cmd>ToggleTermToggleAll<CR>',
      vim.tbl_extend('force', opts, { desc = 'Toggle all terminals' })
    )
  end,
}
