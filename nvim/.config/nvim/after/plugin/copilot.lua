local map = require('hbb.keymap').map

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

map('i', '<C-h>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
map('i', '<C-k>', 'copilot#Previous()', { silent = true, expr = true })
map('i', '<C-j>', 'copilot#Next()', { silent = true, expr = true })
