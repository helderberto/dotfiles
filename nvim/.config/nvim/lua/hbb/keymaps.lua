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

map('n', '<C-s>', ':w!<cr>')
map('n', '<leader>s', ':w!<cr>', { desc = '[S]ave file' })
map('n', '<leader>S', ':noa w<cr>', { desc = '[S]ave file without formatting' })
map('n', '<leader>q', ':q<cr>', { desc = '[Q]uit' })
map('n', '<leader>qq', ':qa!<CR>', { desc = '[Q]uit all windows and close' })

-- Buffer navigation
map('n', '<leader>bd', ':bd<cr>', { desc = '[B]uffer [D]elete' })
map('n', '<leader>bD', ':bufdo bd<cr>', { desc = '[B]uffer [D]elete all' })
map('n', '<leader>;', '<C-^>', { desc = '[;] toggle last buffers' }) -- toggle last buffers

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', { desc = '[C-h] window left' })
map('n', '<C-j>', '<C-w>j', { desc = '[C-j] window down' })
map('n', '<C-k>', '<C-w>k', { desc = '[C-k] window up' })
map('n', '<C-l>', '<C-w>l', { desc = '[C-l] window right' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = '[J] move line up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = '[K] move line down' })
map('v', 'p', '"_dP', { desc = '[P]aste' })

map('n', '<leader>rl', ':so %<CR>', { desc = '[R]eload current lua file' })

-- Quickfix
map('n', '<leader>cn', ':cnext<CR>', { desc = '[C]next' })
map('n', '<leader>cp', ':cprev<CR>', { desc = '[C]prev' })
map('n', '<leader>cr', ':cfdo %s/', { desc = '[C]replace' })

-- Disable arrows
map('n', '<Left>', ':lua print("Use h")<cr>', { desc = 'Disable arrow left' })
map('n', '<Right>', ':lua print("Use l")<cr>', { desc = 'Disable arrow right' })
map('n', '<Up>', ':lua print("Use k")<cr>', { desc = 'Disable arrow up' })
map('n', '<Down>', ':lua print("Use j")<cr>', { desc = 'Disable arrow down' })

-- Git (Fugitive)
map('n', '<leader>g', ':G<cr>', { desc = '[G]it fugitive' })
map('n', '<leader>dh', ':diffget //2<cr>', { desc = '[D]iff [H]unk' })
map('n', '<leader>dl', ':diffget //3<cr>', { desc = '[D]iff [L]eft' })

-- Search & Replace
map('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace current word' })

-- NvimTree
map('n', '<leader>n', ':NvimTreeToggle<cr>', { desc = '[N]vim tree toggle' })
map('n', '<leader>.', ':NvimTreeFindFile<cr>', { desc = '[N]vim tree find file' })

-- Markdown
map('n', '<leader>mm', '<Plug>MarkdownPreviewToggle', { desc = '[M]arkdown [M]arkdownPreviewToggle' })
