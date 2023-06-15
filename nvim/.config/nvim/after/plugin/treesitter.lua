require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'scss',
    'typescript',
    'yaml',
    'vim',
    'elixir',
    'ruby',
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

require('nvim-ts-autotag').setup()
