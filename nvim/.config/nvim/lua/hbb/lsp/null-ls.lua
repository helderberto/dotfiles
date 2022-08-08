local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local b = null_ls.builtins

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = b.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = b.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = b.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = b.code_actions

null_ls.setup {
  debug = false,
  sources = {
    diagnostics.eslint.with {
      prefer_local = 'node_modules/.bin',
    }, -- eslint or eslint_d
    diagnostics.credo, -- Elixir
    code_actions.eslint, -- eslint or eslint_d
    formatting.prettier, -- prettier, eslint, eslint_d, or prettierd
    formatting.stylua,
    completion.spell
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
    end
  end,
}
