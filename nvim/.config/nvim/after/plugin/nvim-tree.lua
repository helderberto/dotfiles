-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup

local function open_nvim_tree()
  -- open the tree but don't focus it
  require('nvim-tree.api').tree.toggle({ focus = false })
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

require('nvim-tree').setup({
  view = {
    width = 40,
  },
  -- actions = {
  --   open_file = {
  --     quit_on_open = true,
  --   },
  -- },
  update_focused_file = {
    enable = true,
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
})
