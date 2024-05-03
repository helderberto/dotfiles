local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
  vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to declaration',
  })
  vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to definition',
  })
  vim.keymap.set(
    'n',
    'gI',
    ':lua vim.lsp.buf.implementation()<CR>',
    { buffer = bufnr, noremap = true, desc = 'Go to implementation' }
  )
  vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to references',
  })
  vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to type definition',
  })
  vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Hover',
  })
  vim.keymap.set('n', '<leader>lf', ':lua vim.lsp.buf.format { async = true }<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Format',
  })
  vim.keymap.set('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Rename',
  })
  vim.keymap.set('n', '<leader>lk', ':lua vim.diagnostic.goto_prev()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to previous diagnostic',
  })
  vim.keymap.set('n', '<leader>lj', ':lua vim.diagnostic.goto_next()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Go to next diagnostic',
  })
  vim.keymap.set(
    { 'n', 'v' },
    '<leader>la',
    ':lua vim.lsp.buf.code_action()<CR>',
    { buffer = bufnr, noremap = true, desc = 'Code Action' }
  )
  vim.keymap.set('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'Signature Help',
  })
  vim.keymap.set('n', '<leader>li', ':LspInfo<CR>', {
    buffer = bufnr,
    noremap = true,
    desc = 'LSP Info',
  })
end)

-- Mason
vim.keymap.set('n', '<leader>lI', ':Mason<cr>', { desc = 'Mason' })
