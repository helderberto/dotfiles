local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local b = null_ls.builtins

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = b.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = b.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = b.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = b.code_actions

null_ls.setup {
  debug = false,
  sources = {
    code_actions.eslint_d, -- using eslint_d because it's faster than eslint
    formatting.prettier.with {
      extra_args = { '--single-quote' },
    },
    formatting.stylua,
    completion.spell,

    -- diagnostics.eslint.with {
    --   prefer_local = 'node_modules/.bin',
    -- }, -- eslint or eslint_d
    -- diagnostics.credo, -- Elixir
    -- diagnostics.rubocop,
  },
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    end
  end,
}
