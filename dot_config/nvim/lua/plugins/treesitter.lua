return {
  -- Treesitter is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local parsers = {
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
      }
      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          -- nvim 0.12 ships bundled markdown parsers; injections conflict with nvim-treesitter queries
          if args.match == 'markdown' or not pcall(vim.treesitter.start, args.buf) then
            return
          end
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
