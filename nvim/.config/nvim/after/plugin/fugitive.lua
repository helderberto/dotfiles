local map = require('hbb.utils').map

-- Git (Fugitive)
map('n', '<leader>gg', ':G<cr>', { desc = 'Git status' })
map('n', '<leader>dh', ':diffget //2<cr>', { desc = 'Git Diff Hunk' })
map('n', '<leader>dl', ':diffget //3<cr>', { desc = 'Git Diff Left' })
map('n', '<leader>ga', '<cmd>G aa<cr>', { desc = 'Git stage all' })
map('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
map('n', '<leader>gca', '<cmd>Git ca<cr>', { desc = 'Git commit amend' })
map('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
map('n', '<leader>gl', '<cmd>Git log --graph --oneline --decorate --all<cr>', { desc = 'Git log' })
map('n', '<leader>gu', '<cmd>Git pull<cr>', { desc = 'Git pull' })
map('n', '<leader>gp', '<cmd>Git ps<cr>', { desc = 'Git push' })
map('n', '<leader>gP', '<cmd>Git pf<cr>', { desc = 'Git push force' })
