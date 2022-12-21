local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require 'hbb.lsp.lsp-installer' -- Install and configure LSP servers
require('hbb.lsp.handlers').setup() -- LSP handlers
require 'hbb.lsp.null-ls' -- null-ls is a language server that acts as a source for diagnostics and code actions from external tools
require 'hbb.lsp.cmp' -- Autocompletion
