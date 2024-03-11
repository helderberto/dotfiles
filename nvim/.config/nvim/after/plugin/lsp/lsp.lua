-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero
local lsp_zero = require('lsp-zero')

lsp_zero.configure('lua_ls', {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lsp_zero.set_preferences({
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  },
})

lsp_zero.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'cssls',
    'html',
    'jsonls',
    'elixirls',
    'gopls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
})
