return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require('which-key').setup({
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      show_help = true, -- show help message on the command line when the popup is visible
    })
  end,
}
