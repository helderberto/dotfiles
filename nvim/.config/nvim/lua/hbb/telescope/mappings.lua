if not pcall(require, 'telescope') then
  return
end

local map = require('hbb.keymap').map

-- Files
map('n', '<leader><leader>', ':Telescope find_files<cr>')
map('n', '<leader>.', ':Telescope file_browser path=%:p:h<cr>')
map('n', '<C-n>', ':Telescope file_browser<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>fq', ':Telescope quickfix<cr>')

-- Git
map('n', '<leader>gs', ':Telescope git_status<cr>')
map('n', '<leader>gl', ':Telescope git_commits<cr>')

-- Neovim
map('n', '<leader>fh', ':Telescope help_tags<cr>')
map('n', '<leader>bo', ':Telescope vim_options<cr>')
map('n', '<C-b>', ':Telescope buffers<cr>')

-- Project
map('n', '<C-p>', ':Telescope project<CR>')
