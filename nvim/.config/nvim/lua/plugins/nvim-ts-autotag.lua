return {
  'windwp/nvim-ts-autotag', -- Automatically close HTML tags

  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
