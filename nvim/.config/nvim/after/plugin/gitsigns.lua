local status, gitsigns = pcall(require, 'gitsigns')
if not status then
  return
end

gitsigns.setup()

local map = require('hbb.utils').map

map('n', '<leader>gt', ':Gitsigns blame_line<cr>', { desc = 'Git Blame' })
