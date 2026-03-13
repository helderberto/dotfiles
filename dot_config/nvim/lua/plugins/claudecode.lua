return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    terminal_cmd = 'zsh -ic claude',
  },

  -- terminal = {
  --   snacks_win_opts = {
  --     position = 'float',
  --     width = 0.85,
  --     height = 0.85,
  --     border = 'rounded',
  --     keys = {
  --       claude_hide_alt = {
  --         '<M-,>',
  --         function(self)
  --           self:hide()
  --         end,
  --         mode = 't',
  --         desc = 'Hide (Alt+,)',
  --       },
  --     },
  --   },
  -- },
  config = true,
  keys = {
    { '<leader>a', nil, desc = 'AI/Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude', mode = { 'n', 't' } },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude', mode = { 'n', 't' } },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    -- Diff management
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
  event = { 'BufReadPre', 'BufNewFile' },
}
