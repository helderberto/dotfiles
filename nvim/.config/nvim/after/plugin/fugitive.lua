local map = require('hbb.utils').map

-- Git (Fugitive)
map('n', '<leader>gs', ':G<cr>', { desc = 'Git status' })
map('n', '<leader>dh', ':diffget //2<cr>', { desc = 'Git Diff Hunk' })
map('n', '<leader>dl', ':diffget //3<cr>', { desc = 'Git Diff Left' })
map('n', '<leader>ga', '<cmd>Gwrite<cr>', { desc = 'Git add' })
map('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
map('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
map('n', '<leader>gl', '<cmd>Git log<cr>', { desc = 'Git log' })
map('n', '<leader>gpl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
map('n', '<leader>gpu', '<cmd>15 split|term git push<cr>', { desc = 'Git push' })
map('n', '<leader>gpf', '<cmd>15 split|term git push -f<cr>', { desc = 'Git push force' })
