vim.keymap.set('n', '<leader>w', ':w!<cr>')
vim.keymap.set('n', '<leader>we', ':noa w<cr>')

vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>qq', ':qa!<cr>')

vim.keymap.set('n', '<leader>e', '<C-w>')
vim.keymap.set('n', '<leader>ev', ':vsplit<cr>')
vim.keymap.set('n', '<leader>es', ':split<cr>')
vim.keymap.set('n', '<leader>+', ':vertical resize +5<cr>')
vim.keymap.set('n', '<leader>-', ':vertical resize -5<cr>')
vim.keymap.set('n', '<leader>=', '<C-w>=<cr>')

vim.keymap.set('n', '<leader>bd', ':bd<cr>')
vim.keymap.set('n', '<leader>bdd', ':bufdo bd<cr>')
vim.keymap.set('n', '<leader>;', '<C-^>') -- toggle last buffers

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'p', '"_dP')

-- Quickfix
vim.keymap.set('n', '<leader>cn', ':cnext<CR>')
vim.keymap.set('n', '<leader>cp', ':cprev<CR>')
vim.keymap.set('n', '<leader>cr', ':cfdo %s/')

-- Disable arrows
vim.keymap.set('n', '<Left>', ':lua print("Use h")<cr>')
vim.keymap.set('n', '<Right>', ':lua print("Use l")<cr>')
vim.keymap.set('n', '<Up>', ':lua print("Use k")<cr>')
vim.keymap.set('n', '<Down>', ':lua print("Use j")<cr>')

-- Git (Fugitive)
vim.keymap.set('n', '<leader>g', ':G<cr>')
vim.keymap.set('n', '<leader>dh', ':diffget //2<cr>')
vim.keymap.set('n', '<leader>dl', ':diffget //3<cr>')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>.', ':NvimTreeFindFile<cr>')

-- MarkdownPreview
vim.keymap.set('n', '<leader>mm', '<Plug>MarkdownPreviewToggle')
