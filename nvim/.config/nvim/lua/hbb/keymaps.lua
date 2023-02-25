local map = require('hbb.utils').map

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<leader>rl', ':so %<CR>', { desc = '[R]eload current lua file' })
map('n', '<leader>e', '<C-w>')
map('n', '<leader>ln', ':set number! norelativenumber<cr>')

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

--- Saving
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr>')
map('n', '<leader>w', '<cmd>w<cr>')
map('n', '<leader>ww', '<cmd>noa w<cr>')

-- Quitting
map('n', '<leader>q', '<cmd>q<cr>', { desc = '[Q]uit' })
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = '[B]uffer [D]elete' })
map('n', '<leader>bD', ':bufdo bd<cr>', { desc = '[B]uffer [D]elete all' })
map('n', '<leader>;', '<C-^>', { desc = 'Toggle last buffers' }) -- toggle last buffers

-- Better window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('v', 'p', '"_dP', { desc = 'Paste over selection' })

-- Disable arrows
map('n', '<Left>', ':lua print("Use h")<cr>', { desc = 'Disable arrow left' })
map('n', '<Right>', ':lua print("Use l")<cr>', { desc = 'Disable arrow right' })
map('n', '<Up>', ':lua print("Use k")<cr>', { desc = 'Disable arrow up' })
map('n', '<Down>', ':lua print("Use j")<cr>', { desc = 'Disable arrow down' })

-- Quickfix
map('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear list' })
map('n', '<leader>cc', ':cclose <cr>', { desc = 'Close list' })
map('n', '<leader>co', ':copen <cr>', { desc = 'Open list' })
map('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
map('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
map('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- Git (Fugitive)
map('n', '<leader>g', ':G<cr>', { desc = '[G]it fugitive' })
map('n', '<leader>dh', ':diffget //2<cr>', { desc = '[D]iff [H]unk' })
map('n', '<leader>dl', ':diffget //3<cr>', { desc = '[D]iff [L]eft' })

-- Search & Replace
map('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace current word' })

-- Markdown
map('n', '<leader>mp', '<Plug>MarkdownPreviewToggle', { desc = '[M]arkdown [P]review' })

-- Toggle relative number
map('n', '<leader>rn', ':set relativenumber!<cr>', { desc = '[R]elative [N]umber' })
