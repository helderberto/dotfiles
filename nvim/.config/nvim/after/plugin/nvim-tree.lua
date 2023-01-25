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
