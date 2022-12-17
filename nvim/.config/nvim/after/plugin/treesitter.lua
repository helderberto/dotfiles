require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'scss',
    'tsx',
    'typescript',
    'yaml',
    'go',
    'vim',
    'elixir',
    'ruby',
  },
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if don't have `tree-sitter` CLI instally locally
  auto_install = true,
  autopairs = { enable = true },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  pickers = { -- choose window to pick when opening a file
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
  },
}
