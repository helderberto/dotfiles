local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "hbb.lsp.lsp-installer"
require("hbb.lsp.handlers").setup()
require "hbb.lsp.null-ls"
