-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

local utils = {}

function utils.map(mode, shortcut, command, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

return utils
