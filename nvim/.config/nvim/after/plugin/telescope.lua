local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    path_display = { 'smart' },
    sorting_strategy = 'descending',
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
        -- ['<C-x>'] = actions.delete_buffer,
        ['<C-h>'] = 'which_key',
      },

      n = {
        ['<esc>'] = actions.close,
        ['X'] = actions.delete_buffer,
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
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- "ignore_case" or "respect_case" or "smart_case"
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')

-- Files
vim.keymap.set('n', '<leader><leader>', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>ff', ':Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>fq', ':Telescope quickfix<cr>')

-- Git
vim.keymap.set('n', '<leader>fs', ':Telescope git_status<cr>')
vim.keymap.set('n', '<leader>fc', ':Telescope git_commits<cr>')

-- Neovim
vim.keymap.set('n', '<leader>fh', ":lua require'telescope.builtin'.help_tags({ layout_strategy = 'vertical' })<cr>")
vim.keymap.set('n', '<leader>fo', ':Telescope vim_options<cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>')
