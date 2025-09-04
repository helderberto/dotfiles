--- save file
vim.keymap.set('n', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>W', '<cmd>noautocmd w<cr>', { desc = 'Save without format' })

-- quit
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit buffer' })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr>', { desc = 'Quit All' })

-- better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- execute code
vim.keymap.set('n', '<leader>x', '<cmd>.lua<cr>', { desc = 'Execute the current line' })
vim.keymap.set('n', '<leader>X', '<cmd>source %<cr>', { desc = 'Execute current file' })

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
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })

-- Navigate between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

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
vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word' })

-- toggle relative number
vim.keymap.set('n', '<leader>lr', ':set relativenumber!<cr>', { desc = 'Toggle relative number' })

-- lazy
vim.keymap.set('n', '<leader>ll', '<cmd>Lazy<cr>', { desc = 'Lazy' })
