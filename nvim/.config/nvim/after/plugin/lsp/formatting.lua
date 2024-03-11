local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', 'prettier' },
    javascriptreact = { 'prettierd', 'prettier' },
    typescript = { 'prettierd', 'prettier' },
    typescriptreact = { 'prettierd', 'prettier' },
    json = { 'prettierd', 'prettier' },
    markdown = { 'prettierd', 'prettier' },
    html = { 'htmlbeautifier' },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>F', function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = 'Format file or range (in visual mode)' })
