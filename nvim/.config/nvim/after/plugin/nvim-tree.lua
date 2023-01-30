-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local function open_nvim_tree()
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

require('nvim-tree').setup({
  view = {
    width = 40,
  },
  update_focused_file = {
    enable = true,
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
})
