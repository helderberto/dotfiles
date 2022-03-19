local map = require('hbb.utils').map

-- Leader key "Space"
vim.g.mapleader = " "

-- Misc
map('i', '<C-c>', '<esc>')
map('n', '<esc>', ':noh<cr><cr>')

-- Easy saving and exiting
map('n', '<leader>w', ':w!<CR>')
map('n', '<leader>we', ':noa w<CR>')
map('n', '<leader>q', ':q!<CR>')

-- Easy buffer navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Window manipulation
map('n', '<leader>.', ':Fern . -reveal=%<CR><C-w>=')
map('n', '<leader>n', ':Fern . -drawer -width=40 -reveal=% -toggle<CR><C-w>=')
map('n', '<leader>e', '<C-w>')
map('n', '<leader>ev', ':vsplit<CR>')
map('n', '<leader>es', ':split<CR>')
map('n', '<leader>+', ':vertical resize +5<CR>')
map('n', '<leader>-', ':vertical resize -5<CR>')
map('n', '<leader>=', '<C-w>=<CR>')
map('n', '<leader>l', '<C-^>') -- navigate between last two files

-- Lines movement
map('v', 'J', ":m '>+1<CR>gv=gv") -- move line up
map('v', 'K', ":m '<-2<CR>gv=gv") -- move line down

-- Source configuration
map('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- Buffers & history
map('n', '<leader>b', ':Buffers<CR>')
map('n', '<leader>bd', ':bdelete!<CR>')
map('n', '<leader>h', ':History<CR>')

-- search
map('n', '<leader><leader>', ":lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>")
map('n', '<C-b>', ":lua require('telescope.builtin').buffers()<CR>")
map('n', '<leader>fb', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>")
map('n', '<leader>fq', ":lua require('telescope.builtin').quickfix()<CR>")

-- Replace
map('v', '<C-r>', 'hy:%s/<C-r><C-w>//gc<left><left><left>')
map('v', '<leader>r', 'hy:%s/<C-r><C-w>//gc<left><left><left>')
map('n', '<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')
map('n', '<leader>rr', ':%s//gc<Left><Left><Left>')

-- Disable arrows
map('n', '<Left>', ':echoe "Use h"<CR>')
map('n', '<Right>', ':echoe "Use l"<CR>')
map('n', '<Up>', ':echoe "Use k"<CR>')
map('n', '<Down>',  ':echoe "Use j"<CR>')

-- Git
map('n', '<leader>g', ':G<CR>')
map('n', '<leader>dh', ':diffget //2<CR>')
map('n', '<leader>dl', ':diffget //3<CR>')

-- Quickfix
function ToggleQuickFix()
  if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1 then
    vim.cmd([[copen]])
  else
    vim.cmd([[cclose]])
  end
end

map('n', '<leader>co', ':call ToggleQuickFix()<CR>')
map('n', '<leader>cn', ':cnext<CR>')
map('n', '<leader>cp', ':cprev<CR>')
map('n', '<leader>cr', ':cfdo %s/')
