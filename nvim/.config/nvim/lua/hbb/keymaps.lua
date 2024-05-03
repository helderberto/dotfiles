local map = require('hbb.utils').map

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

--- Saving
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save and format' })
map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save and format' })
map('n', '<leader>ww', '<cmd>noa w<cr>', { desc = 'Save without format' })

-- Quitting
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit buffer' })
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = 'Buffer Delete' })
map('n', '<leader>bD', ':bufdo bd<cr>', { desc = 'Buffer Delete all' })
map('n', '<leader>;', '<C-^>', { desc = 'Toggle last buffers' }) -- toggle last buffers

-- Better window navigation
map('n', '<leader>e', '<C-w>', { desc = 'Window' })
map('n', '<leader>es', '<C-w>s', { desc = 'Split window' })
map('n', '<leader>ev', '<C-w>v', { desc = 'Split window vertically' })

-- better up/down
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down' })
map('v', 'p', '"_dP', { desc = '[P] paste' })

-- Quickfix
map('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear list' })
map('n', '<leader>cc', ':cclose <cr>', { desc = 'Close list' })
map('n', '<leader>co', ':copen <cr>', { desc = 'Open list' })
map('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
map('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
map('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- Search & Replace
map('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word' })

-- Toggle relative number
map('n', '<leader>rn', ':set relativenumber!<cr>', { desc = 'Relative Number' })
