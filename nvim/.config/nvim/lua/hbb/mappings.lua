local map = require('hbb.utils').map

map('i', '<C-c>', '<esc>')
map('n', '<esc>', ':noh<cr><cr>')

map('n', '<leader>w', ':w!<cr>')
map('n', '<leader>we', ':noa w<cr>')

map('n', '<leader>q', ':q<cr>')
map('n', '<leader>qq', ':qa!<cr>')

map('n', '<leader>e', '<C-w>')
map('n', '<leader>ev', ':vsplit<cr>')
map('n', '<leader>es', ':split<cr>')
map('n', '<leader>+', ':vertical resize +5<cr>')
map('n', '<leader>-', ':vertical resize -5<cr>')
map('n', '<leader>=', '<C-w>=<cr>')

map('n', '<leader>bd', ':bd<cr>')
map('n', '<leader>bdd', ':bufdo bd<cr>')
map('n', '<leader>;', '<C-^>') -- toggle last buffers

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', 'p', '"_dP')

-- Quickfix
map('n', '<leader>cn', ':cnext<CR>')
map('n', '<leader>cp', ':cprev<CR>')
map('n', '<leader>cr', ':cfdo %s/')

map('n', '<Left>', ':lua print("Use h")<cr>')
map('n', '<Right>', ':lua print("Use l")<cr>')
map('n', '<Up>', ':lua print("Use k")<cr>')
map('n', '<Down>', ':lua print("Use j")<cr>')

map('n', '<leader>g', ':G<cr>')
map('n', '<leader>dh', ':diffget //2<cr>')
map('n', '<leader>dl', ':diffget //3<cr>')

map('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

map('n', '<leader>n', ':NvimTreeToggle<cr>')
map('n', '<leader>.', ':NvimTreeFindFile<cr>')

-- MarkdownPreview
-- map('n', '<C-s>', '<Plug>MarkdownPreview')
-- map('n', '<M-s>', '<Plug>MarkdownPreviewStop')
map('n', '<leader>mm', '<Plug>MarkdownPreviewToggle')
