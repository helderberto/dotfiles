return {
  'dracula/vim',
  name = 'dracula',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd([[colorscheme dracula]])
  end,
}
