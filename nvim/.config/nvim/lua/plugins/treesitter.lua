return {
  -- Treesitter is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    init = function()
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require('nvim-treesitter.query_predicates')
    end,
    opts = {
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
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    'windwp/nvim-ts-autotag',

    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Insert or delete brackets, parens, quotes in pair
  {
    'windwp/nvim-autopairs',

    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
      })
    end,
  },
}
