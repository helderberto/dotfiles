local lsp = require('lsp-zero')
local map = require('hbb.utils').map

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'cssls',
  'html',
  'jsonls',
  'elixirls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  },
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gI', ':lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
  map('n', '<leader>lf', ':lua vim.lsp.buf.format { async = true }<CR>', opts)
  map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<leader>lk', ':lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', '<leader>lj', ':lua vim.diagnostic.goto_next()<CR>', opts)
  map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<leader>li', ':LspInfo<CR>', opts)
  map('n', '<leader>lI', ':LspInstallInfo<CR>', opts)
end)

local null_ls = require('null-ls')

local null_opts = lsp.build_options('null-ls', {
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
  end,
})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    -- formatting
    formatting.prettier,
    formatting.stylua, -- Lua

    -- diagnostics
    diagnostics.eslint,
    diagnostics.credo, -- Elixir
    diagnostics.rubocop, -- Ruby

    -- code actions
    action.eslint,
    action.refactoring,

    -- completion
    completion.spell,
  },
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = false, -- disable virtual text
  sort_severity = true,
})
