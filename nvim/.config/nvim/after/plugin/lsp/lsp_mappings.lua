local lsp = require('lsp-zero')
local map = require('hbb.utils').map

lsp.on_attach(function(_, bufnr)
  map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to declaration',
  })
  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to definition',
  })
  map(
    'n',
    'gI',
    ':lua vim.lsp.buf.implementation()<CR>',
    { buffer = bufnr, noremap = true, desc = 'Go to implementation' }
  )
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to references',
  })
  map('n', 'gt', ':lua vim.lsp.buf.type_definition', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to type definition',
  })
  map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Hover',
  })
  map('n', '<leader>lf', ':lua vim.lsp.buf.format { async = true }<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Format',
  })
  map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Rename',
  })
  map('n', '<leader>lk', ':lua vim.diagnostic.goto_prev()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to previous diagnostic',
  })
  map('n', '<leader>lj', ':lua vim.diagnostic.goto_next()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to next diagnostic',
  })
  map(
    { 'n', 'v' },
    '<leader>la',
    ':lua vim.lsp.buf.code_action()<CR>',
    { buffer = bufnr, noremap = true, desc = 'Code Action' }
  )
  map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Signature Help',
  })
  map('n', '<leader>li', ':LspInfo<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'LSP Info',
  })
end)

-- Mason
map('n', '<leader>lI', ':Mason<cr>', { desc = 'Mason' })
