local map = require('hbb.utils').map

-- Set leader key as space
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Misc
map('n', '<leader>rl', ':so %<CR>', { desc = '[R]eload current lua file' })
map('n', '<leader>e', '<C-w>')

-- Saving & Quitting
map('n', '<C-s>', ':w!<cr>')
map('n', '<leader>w', ':w!<cr>', { desc = '[W]rite file' })
map('n', '<leader>ww', ':noa w<cr>', { desc = '[W]rite file without formatting' })
map('n', '<leader>wq', ':wqa<cr>', { desc = '[W]rite [Q]uit all' })
map('n', '<leader>q', ':q<cr>', { desc = '[Q]uit' })
map('n', '<leader>qq', ':qa!<CR>', { desc = '[Q]uit all windows and close' })

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = '[B]uffer [D]elete' })
map('n', '<leader>bD', ':bufdo bd<cr>', { desc = '[B]uffer [D]elete all' })
map('n', '<leader>;', '<C-^>', { desc = 'Toggle last buffers' }) -- toggle last buffers

-- Better window navigation
map('n', '<C-h>', '<C-w>h', { desc = '[C-h] window left' })
map('n', '<C-j>', '<C-w>j', { desc = '[C-j] window down' })
map('n', '<C-k>', '<C-w>k', { desc = '[C-k] window up' })
map('n', '<C-l>', '<C-w>l', { desc = '[C-l] window right' })

-- Move text up & down
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down' })
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
