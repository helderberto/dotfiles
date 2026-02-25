return {
  {
    'tpope/vim-fugitive', -- Git commands in nvim
    config = function()
      -- Git status (Neogit-like binding)
      vim.keymap.set('n', '<leader>gg', ':G<cr>', { desc = 'Git status' })

      -- Git diff and merge helpers
      vim.keymap.set('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>', { desc = 'Git diff (vertical split)' })
      vim.keymap.set('n', '<leader>gdh', ':diffget //2<cr>', { desc = 'Git Diff Hunk (ours)' }) -- Current change
      vim.keymap.set('n', '<leader>gdl', ':diffget //3<cr>', { desc = 'Git Diff Hunk (theirs)' }) -- Incoming change

      -- Git pull/push commands
      vim.keymap.set('n', '<leader>gu', '<cmd>Git pull<cr>', { desc = 'Git pull' })
      vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })
      vim.keymap.set('n', '<leader>gP', '<cmd>Git push --force<cr>', { desc = 'Git push force' })

      -- Git commit and stage
      vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
      vim.keymap.set('n', '<leader>ga', '<cmd>Git add .<cr>', { desc = 'Git add all' })

      -- Git staging shortcuts (Neogit-like experience)
      vim.keymap.set('n', '<leader>gs', '<cmd>Gwrite<cr>', { desc = 'Git stage' })
      vim.keymap.set('n', '<leader>gr', '<cmd>Gread<cr>', { desc = 'Git reset' }) -- Unstage/reset

      -- Browse git log
      vim.keymap.set(
        'n',
        '<leader>go',
        '<cmd>Git log --oneline --abbrev-commit --graph --decorate<cr>',
        { desc = 'Git log' }
      )

      -- Interactive rebase
      vim.keymap.set('n', '<leader>gri', function()
        local count = vim.fn.input('Number of commits to rebase: ')
        vim.cmd('Git rebase -i HEAD~' .. count)
      end, { desc = 'Git Interactive Rebase' })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      -- Enable gitsigns
      require('gitsigns').setup()

      -- keymaps
      vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<cr>', { desc = 'Git Blame' })
    end,
  },
}
