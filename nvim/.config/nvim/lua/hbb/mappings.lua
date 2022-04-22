local map = require('hbb.keymap').map

-- Misc
map('i', '<C-c>', '<esc>')
map('n', '<esc>', ':noh<cr><cr>')

-- Saving
map('n', '<leader>w', ':w!<cr>')
map('n', '<leader>we', ':noa w<cr>')
map('i', '<leader>we', ':noa w<cr>')

-- Window explorer
map('n', '<leader>e', '<C-w>')
map('n', '<leader>ev', ':vsplit<cr>')
map('n', '<leader>es', ':split<cr>')
map('n', '<leader>+', ':vertical resize +5<cr>')
map('n', '<leader>-', ':vertical resize -5<cr>')
map('n', '<leader>=', '<C-w>=<cr>')

-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Select & movement

-- move line up
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', 'p', '"_dP')

-- Source current configuration
map('n', '<leader><cr>', ':so ~/.config/nvim/init.lua<cr>')

-- Switch between the last two files
map('n', '<leader>l', '<C-^>')

-- Quickfix
map('n', '<leader>co', ':call ToggleQuickFix()<CR>')
function ToggleQuickFix()
  if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
    vim.cmd [[copen]]
  else
    vim.cmd [[cclose]]
  end
end

map('n', '<leader>cn', ':cnext<CR>')
map('n', '<leader>cp', ':cprev<CR>')
map('n', '<leader>cr', ':cfdo %s/')

-- Disable arrows
map('n', '<Left>', ':echoe "Use h"')
map('n', '<Right>', ':echoe "Use l"')
map('n', '<Up>', ':echoe "Use k"')
map('n', '<Down>', ':echoe "Use j"')

-- Git
map('n', '<leader>g', ':G<cr>')
map('n', '<leader>dh', ':diffget //2')
map('n', '<leader>dl', ':diffget //3')
