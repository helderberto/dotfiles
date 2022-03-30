-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"
local function map(mode, shortcut, command, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

-- Misc
map("i", "<C-c>", "<esc>")
map("n", "<C-c>", ":noh<cr><cr>")

-- Saving
map("n", "<leader>w", ":w!<cr>")
map("n", "<leader>we", ":noa w<cr>")
map("i", "<leader>we", ":noa w<cr>")

-- Exiting
map("i", "<leader>qq", "<esc>:qa!<cr>")
map("n", "<leader>qq", "<esc>:qa!<cr>")
map("i", "<leader>q", "<esc>:q!<cr>")
map("n", "<leader>q", ":q!<cr>")

-- Window explorer
map("n", "<leader>e", "<C-w>")
map("n", "<leader>ev", ":vsplit<cr>")
map("n", "<leader>es", ":split<cr>")
map("n", "<leader>+", ":vertical resize +5<cr>")
map("n", "<leader>-", ":vertical resize -5<cr>")
map("n", "<leader>=", "<C-w>=<cr>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Select & movement

-- move line up
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "p", '"_dP')


-- Source current configuration
map("n", "<leader><cr>", ":so ~/.config/nvim/init.lua<cr>")

-- search (history, buffers)
map("n", "<leader><leader>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
map("n", "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
map("n", "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>bd", ":bdelete %<cr>")

-- Switch between the last two files
map("n", "<leader>l", "<C-^>")

-- Quickfix
map('n', '<leader>co', ':call ToggleQuickFix()<CR>')
function ToggleQuickFix()
  if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1 then
    vim.cmd([[copen]])
  else
    vim.cmd([[cclose]])
  end
end

map('n', '<leader>cn', ':cnext<CR>')
map('n', '<leader>cp', ':cprev<CR>')
map('n', '<leader>cr', ':cfdo %s/')

-- Replace
map('v', '<C-r>', 'hy:%s/<C-r><C-w>//gc<left><left><left>')
map('v', '<leader>r', 'hy:%s/<C-r><C-w>//gc<left><left><left>')
map('n', '<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')
map('n', '<leader>rr', ':%s//gc<Left><Left><Left>')


-- Disable arrows
map("n", "<Left>", ':echoe "Use h"')
map("n", "<Right>", ':echoe "Use l"')
map("n", "<Up>", ':echoe "Use k"')
map("n", "<Down>", ':echoe "Use j"')

-- Git
map("n", "<leader>g", ":G<cr>")
map("n", "<leader>dh", ":diffget //2")
map("n", "<leader>dl", ":diffget //3")
