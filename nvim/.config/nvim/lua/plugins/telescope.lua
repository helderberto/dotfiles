return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' }, -- Lua utils methods shared with plugins
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-github.nvim' },
  },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
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

    -- Key mappings for Telescope
    local builtin = require('telescope.builtin')

    -- General Mappings
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })

    -- Quickfix & Diagnostics
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Quickfix List' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })

    -- Git Mappings
    vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find Git Files' })

    -- Neovim Options
    vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Find Vim Options' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })

    -- Buffers and File Operations
    vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy Find Current Buffer' })
  end,
}
