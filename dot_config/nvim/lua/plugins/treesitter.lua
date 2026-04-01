return {
  -- Treesitter is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- track HEAD for nvim 0.12 compat
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
        'markdown',
        'markdown_inline',
      },
      highlight = {
        enable = true,
        disable = { 'markdown', 'markdown_inline' },
      },
      indent = {
        enable = true,
        disable = {},
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
