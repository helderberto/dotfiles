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
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
  },
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
