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

    local keymap = vim.keymap.set
    local Terminal = require('toggleterm.terminal').Terminal

    -- Terminal keymaps for navigation and control
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Exit terminal mode
      keymap('t', '<esc>', [[<C-\><C-n>]], opts)
      keymap('t', 'jk', [[<C-\><C-n>]], opts)

      -- Window navigation from terminal
      keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

      -- Window management
      keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

      -- Terminal navigation within terminal mode
      keymap('t', '<C-n>', [[<C-\><C-n>:ToggleTermNext<CR>]], opts)
      keymap('t', '<C-p>', [[<C-\><C-n>:ToggleTermPrev<CR>]], opts)

      -- Quick terminal creation from terminal mode
      keymap('t', '<C-t>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
    end

    -- Apply terminal keymaps
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

    -- NEW: Enhanced terminal navigation
    keymap('n', '<leader>tn', '<cmd>ToggleTermNext<CR>', { desc = 'Next terminal' })
    keymap('n', '<leader>tp', '<cmd>ToggleTermPrev<CR>', { desc = 'Previous terminal' })
    keymap('n', '<leader>tc', '<cmd>ToggleTerm<CR>', { desc = 'Create/toggle terminal' })

    -- Terminal directions (keep your existing ones)
    keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Terminal horizontal' })
    keymap('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Terminal vertical' })
    keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Terminal float' })

    -- NEW: Quick access to numbered terminals (more intuitive)
    for i = 1, 9 do
      keymap('n', '<leader>t' .. i, '<cmd>' .. i .. 'ToggleTerm<CR>', { desc = 'Terminal ' .. i })
    end

    local function close_all_terminals()
      local terms = require('toggleterm.terminal').get_all()
      for _, term in pairs(terms) do
        if term:is_open() then
          term:close()
        end
      end
    end

    -- Terminal management with corrected keybindings
    keymap('n', '<leader>tq', close_all_terminals, { desc = 'Close all terminals' })
    keymap('n', '<leader>ta', '<cmd>ToggleTermToggleAll<CR>', { desc = 'Toggle all terminals' })

    -- Send to terminal (keep your existing ones)
    keymap('n', '<leader>ts', '<cmd>ToggleTermSendCurrentLine<CR>', { desc = 'Send line to terminal' })
    keymap('v', '<leader>ts', '<cmd>ToggleTermSendVisualSelection<CR>', { desc = 'Send selection to terminal' })

    local function smart_terminal_toggle(direction)
      local terms = require('toggleterm.terminal').get_all()
      local current_dir_terms = {}

      -- Find terminals in current direction
      for _, term in pairs(terms) do
        if term.direction == direction then
          table.insert(current_dir_terms, term)
        end
      end

      -- If no terminals in this direction, create one
      if #current_dir_terms == 0 then
        vim.cmd('ToggleTerm direction=' .. direction)
      else
        -- Toggle the last used terminal in this direction
        current_dir_terms[#current_dir_terms]:toggle()
      end
    end

    -- Smart terminal toggles
    keymap('n', '<C-t>h', function()
      smart_terminal_toggle('horizontal')
    end, { desc = 'Smart horizontal terminal' })
    keymap('n', '<C-t>v', function()
      smart_terminal_toggle('vertical')
    end, { desc = 'Smart vertical terminal' })
    keymap('n', '<C-t>f', function()
      smart_terminal_toggle('float')
    end, { desc = 'Smart float terminal' })

    -- Node REPL (but with better keybinding)
    local node = Terminal:new({ cmd = 'node', hidden = true })
    function _NODE_TOGGLE()
      node:toggle()
    end
    keymap('n', '<leader>tr', '<cmd>lua _NODE_TOGGLE()<CR>', { desc = 'Node REPL' })
  end,
}
