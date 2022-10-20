local buf_map = require('hbb.keymap').buf_map

local M = {}

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
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
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

local function lsp_keymaps(bufnr)
  -- define LSP commands
  vim.cmd 'command! LspDef lua vim.lsp.buf.definition()'
  vim.cmd 'command! LspDeclaration lua vim.lsp.buf.declaration()'
  vim.cmd 'command! LspFormatting lua vim.lsp.buf.formatting()'
  vim.cmd 'command! LspCodeAction lua vim.lsp.buf.code_action()'
  vim.cmd 'command! LspHover lua vim.lsp.buf.hover()'
  vim.cmd 'command! LspRename lua vim.lsp.buf.rename()'
  vim.cmd 'command! LspRefs lua vim.lsp.buf.references()'
  vim.cmd 'command! LspTypeDef lua vim.lsp.buf.type_definition()'
  vim.cmd 'command! LspImplementation lua vim.lsp.buf.implementation()'
  vim.cmd 'command! LspDiagPrev lua vim.diagnostic.goto_prev()'
  vim.cmd 'command! LspDiagNext lua vim.diagnostic.goto_next()'
  vim.cmd 'command! LspDiagLine lua vim.diagnostic.open_float()'
  vim.cmd 'command! LspSignatureHelp lua vim.lsp.buf.signature_help()'

  -- use created LSP commands
  buf_map(bufnr, 'n', 'gD', ':LspDeclaration<CR>')
  buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  buf_map(bufnr, 'n', 'gi', ':LspImplementation<CR>')
  buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
  buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
  buf_map(bufnr, 'n', '<C-x><C-x>', ':LspSignatureHelp<CR>')
end

M.on_attach = function(client, bufnr)
  if client.name == 'tsserver' or client.name == 'html' or client.name == 'sumneko_lua' or client.name == 'jsonls' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
