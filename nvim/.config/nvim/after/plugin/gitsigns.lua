local status, gitsigns = pcall(require, 'gitsigns')
if not status then
  return
end

gitsigns.setup()

vim.keymap.set('n', '<leader>gt', ':Gitsigns blame_line<cr>', { desc = 'Git Blame' })
