local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    path_display = { 'smart' },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--trim',
    },
    sorting_strategy = 'descending',
    file_ignore_patterns = {
      'dist/.*',
      '%.git/.*',
      '%.vim/.*',
      'node_modules/.*',
      '%.idea/.*',
      '%.vscode/.*',
      '%.history/.*',
    },
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-d>'] = require('telescope.actions').delete_buffer,
        ['<C-h>'] = 'which_key',
      },

      n = {
        ['<esc>'] = actions.close,
        ['<C-d>'] = require('telescope.actions').delete_buffer,
        ['<CR>'] = actions.select_default,
        ['?'] = actions.which_key,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
    },
    find_files = {
      find_command = {
        'fd',
        '--type',
        'file',
        '--type',
        'symlink',
        '--hidden',
        '--exclude',
        '.git',
      },
    },
  },
  extensions = {
    -- file_browser = {
    --   hidden = true,
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    --   mappings = {
    --     ['i'] = {
    --       -- your custom insert mode mappings
    --     },
    --     ['n'] = {
    --       -- your custom normal mode mappings
    --     },
    --   },
    -- },
    project = {
      base_dirs = {
        '~/workspace/',
        '~/.dotfiles/',
      },
      hidden_files = true, -- default: false
      theme = 'dropdown',
      order_by = 'asc',
    },
  },
}

-- require('telescope').load_extension 'file_browser'
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'gh'
require('telescope').load_extension 'project'
