local M = {}

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"
M.map = function(mode, shortcut, command, opts)
  opts = opts or { noremap = true }
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

M.buf_map = function(bufnr, mode, shortcut, command, opts)
  opts = opts or { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, mode, shortcut, command, opts)
end

return M
