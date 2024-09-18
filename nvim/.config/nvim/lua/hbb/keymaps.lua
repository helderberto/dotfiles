local set = vim.keymap.set

--- save file
set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
set('n', '<leader>ww', '', { desc = 'Save without format' })

-- quit
set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit buffer' })
set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- better indenting
set('v', '<', '<gv')
set('v', '>', '>gv')

set('n', '<leader>x', '<cmd>.lua<cr>', { desc = 'Execute the current line' })
set('n', '<leader><leader>x', '<cmd>source %<cr>', { desc = 'Execute current file' })

-- clear search with <esc>
set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- new file
set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- buffers
set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
set('n', '<leader>bd', ':bdelete<cr>', { desc = 'Buffer Delete' })
set('n', '<leader>bD', ':bufdo bd<cr>', { desc = 'Buffer Delete all' })
set('n', '<leader>;', '<C-^>', { desc = 'Toggle last buffers' }) -- toggle last buffers

-- better window navigation
set('n', '<leader>e', '<C-w>', { desc = 'Window' })
set('n', '<leader>es', '<C-w>s', { desc = 'Split window' })
set('n', '<leader>ev', '<C-w>v', { desc = 'Split window vertically' })

-- better up/down
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down' })
set('v', 'p', '"_dP', { desc = '[P] paste' })

-- quickfix
set('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear list' })
set('n', '<leader>cc', ':cclose <cr>', { desc = 'Close list' })
set('n', '<leader>co', ':copen <cr>', { desc = 'Open list' })
set('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
set('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
set('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- search & replace
set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word' })

-- toggle relative number
set('n', '<leader>rn', ':set relativenumber!<cr>', { desc = 'Relative Number' })

-- lazy
set('n', '<leader>ll', '<cmd>Lazy<cr>', { desc = 'Lazy' })
