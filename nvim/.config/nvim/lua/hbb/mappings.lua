local map = require('hbb.keymap').map

-- Misc
map('i', '<C-c>', '<esc>')
map('n', '<esc>', ':noh<cr><cr>')

-- Saving
map('n', '<leader>w', ':w!<cr>')
map('n', '<leader>we', ':noa w<cr>')
map('i', '<leader>we', ':noa w<cr>')

-- Exiting
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>qq', ':qa!<cr>')

-- Window explorer
map('n', '<leader>e', '<C-w>')
map('n', '<leader>ev', ':vsplit<cr>')
map('n', '<leader>es', ':split<cr>')
map('n', '<leader>+', ':vertical resize +5<cr>')
map('n', '<leader>-', ':vertical resize -5<cr>')
map('n', '<leader>=', '<C-w>=<cr>')

-- Buffers
map('n', '<leader>bd', ':bd<cr>')
map('n', '<leader>bdd', ':bufdo bd<cr>')
map('n', '<leader>;', '<C-^>') -- toggle last buffers

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
map('n', '<Left>', ':lua print("Use h")<cr>')
map('n', '<Right>', ':lua print("Use l")<cr>')
map('n', '<Up>', ':lua print("Use k")<cr>')
map('n', '<Down>', ':lua print("Use j")<cr>')

-- Git
map('n', '<leader>g', ':G<cr>')
map('n', '<leader>dh', ':diffget //2<cr>')
map('n', '<leader>dl', ':diffget //3<cr>')

-- Search & Replace
map('n', '<leader>r', ':%s/<C-r><C-w>//g<left><left>')
map('n', '<leader>rc', ':%s/<C-r><C-w>//gc<left><left><left>')
map('n', '<leader>rl', ':s/<C-r><C-w>//gc<left><left><left>') -- replace line

-- NvimTree
map('n', '<leader>n', ':NvimTreeToggle<cr>')
map('n', '<leader>.', ':NvimTreeFindFile<cr>')

-- Copilot
map('i', '<C-h>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
map('i', '<C-k>', 'copilot#Previous()', { silent = true, expr = true })
map('i', '<C-j>', 'copilot#Next()', { silent = true, expr = true })

-- MarkdownPreview
-- map('n', '<C-s>', '<Plug>MarkdownPreview')
-- map('n', '<M-s>', '<Plug>MarkdownPreviewStop')
map('n', '<leader>pp', '<Plug>MarkdownPreviewToggle')
