local M = {}

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Creates a new mapping
-- @param mode string|table: can be for example 'n', 'i', 'v', 'x', 's', 't', '!', or a table with any combination of those
-- @param lhs string: the left hand side of the mapping
-- @param rhs string: the right hand side of the mapping
-- @param opts table: options for the mapping e.g. {noremap = true, silent = true}
M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
