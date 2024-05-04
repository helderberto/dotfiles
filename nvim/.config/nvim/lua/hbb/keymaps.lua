--- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>ww', '', { desc = 'Save without format' })

-- quit
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit buffer' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- clear search with <esc>
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- new file
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = 'Buffer Delete' })
vim.keymap.set('n', '<leader>bD', ':bufdo bd<cr>', { desc = 'Buffer Delete all' })
vim.keymap.set('n', '<leader>;', '<C-^>', { desc = 'Toggle last buffers' }) -- toggle last buffers

-- better window navigation
vim.keymap.set('n', '<leader>e', '<C-w>', { desc = 'Window' })
vim.keymap.set('n', '<leader>es', '<C-w>s', { desc = 'Split window' })
vim.keymap.set('n', '<leader>ev', '<C-w>v', { desc = 'Split window vertically' })

-- better up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'p', '"_dP', { desc = '[P] paste' })

-- quickfix
vim.keymap.set('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear list' })
vim.keymap.set('n', '<leader>cc', ':cclose <cr>', { desc = 'Close list' })
vim.keymap.set('n', '<leader>co', ':copen <cr>', { desc = 'Open list' })
vim.keymap.set('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
vim.keymap.set('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
vim.keymap.set('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- search & replace
vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word' })

-- toggle relative number
vim.keymap.set('n', '<leader>rn', ':set relativenumber!<cr>', { desc = 'Relative Number' })

-- lazy
vim.keymap.set('n', '<leader>ll', '<cmd>Lazy<cr>', { desc = 'Lazy' })
