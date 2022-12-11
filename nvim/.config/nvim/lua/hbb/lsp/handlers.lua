local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

local buf_map = require('hbb.keymap').buf_map

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      style = 'minimal',
      source = 'always',
      header = '',
      prefix = '',
      border = 'rounded',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local function lsp_keymaps(bufnr)
  buf_map(bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  buf_map(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  buf_map(bufnr, 'n', 'gI', ':lua vim.lsp.buf.implementation()<CR>')
  buf_map(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  -- buf_map(bufnr, 'n', 'gl', ':lua vim.diagnostic.open_float()<CR>')
  buf_map(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  buf_map(bufnr, 'n', '<leader>lf', ':lua vim.lsp.buf.format { async = true }<CR>')
  buf_map(bufnr, 'n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')
  buf_map(bufnr, 'n', '<leader>lk', ':lua vim.diagnostic.goto_prev()<CR>')
  buf_map(bufnr, 'n', '<leader>lj', ':lua vim.diagnostic.goto_next()<CR>')
  buf_map(bufnr, 'n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>')
  buf_map(bufnr, 'n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>')
  buf_map(bufnr, 'n', '<leader>li', ':LspInfo<CR>')
  buf_map(bufnr, 'n', '<leader>lI', ':LspInstallInfo<CR>')
end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
      augroup END
    ]]
  end
end

M.on_attach = function(client, bufnr)
  local clients = {
    'tsserver',
    'sumneko_lua',
    'jsonls',
    'html',
  }

  for _, c in ipairs(clients) do
    if client.name == c then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return M
