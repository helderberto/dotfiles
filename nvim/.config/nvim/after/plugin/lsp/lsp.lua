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

local null_ls = require('null-ls')

local null_opts = lsp_zero.build_options('null-ls', {
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ name = 'null-ls' })")
    end
  end,
})

local lint = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    -- formatting
    formatting.prettierd, -- JavaScript / TypeScript
    formatting.stylua, -- Lua

    -- linting
    lint.eslint_d, -- JavaScript / TypeScript
    -- lint.credo, -- Elixir
    -- lint.golangci_lint, -- Go

    -- code actions
    action.eslint_d, -- JavaScript / TypeScript
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
