return {
  {
    'tpope/vim-fugitive', -- Git commands in nvim
    config = function()
      -- Git status (Neogit-like binding)
      vim.keymap.set('n', '<leader>gg', ':G<cr>', { desc = 'Git status' })

      -- Git diff and merge helpers
      vim.keymap.set('n', '<leader>gh', ':diffget //2<cr>', { desc = 'Git Diff Hunk (ours)' }) -- Current change
      vim.keymap.set('n', '<leader>gl', ':diffget //3<cr>', { desc = 'Git Diff Hunk (theirs)' }) -- Incoming change
      vim.keymap.set('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>', { desc = 'Git diff (vertical split)' })

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
      vim.keymap.set('n', '<leader>glg', '<cmd>Git log<cr>', { desc = 'Git log' })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      -- Enable gitsigns
      require('gitsigns').setup()

      -- Gitsigns keymaps (stage/unstage hunks, preview diffs, etc.)
      vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<cr>', { desc = 'Git Blame' })
      vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<cr>', { desc = 'Git Preview Hunk' })
      vim.keymap.set('n', '<leader>gS', ':Gitsigns stage_hunk<cr>', { desc = 'Git Stage Hunk' })
      vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<cr>', { desc = 'Git Reset Hunk' })
      vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<cr>', { desc = 'Git Unstage Hunk' })
    end,
  },
}
