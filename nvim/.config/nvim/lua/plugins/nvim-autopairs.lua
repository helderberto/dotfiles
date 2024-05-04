return {
  'windwp/nvim-autopairs', -- Insert or delete brackets, parens, quotes in pair

  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { 'TelescopePrompt', 'vim' },
    })
  end,
}
