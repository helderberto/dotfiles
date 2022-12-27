local lsp_installer = require 'nvim-lsp-installer'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local buf_map = require('hbb.utils').buf_map
local function on_attach(client, bufnr)
  -- Mappings
  buf_map(bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  buf_map(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  buf_map(bufnr, 'n', 'gI', ':lua vim.lsp.buf.implementation()<CR>')
  buf_map(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  buf_map(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  buf_map(bufnr, 'n', '<leader>lf', ':lua vim.lsp.buf.format { async = true }<CR>')
  buf_map(bufnr, 'n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')
  buf_map(bufnr, 'n', '<leader>lk', ':lua vim.diagnostic.goto_prev()<CR>')
  buf_map(bufnr, 'n', '<leader>lj', ':lua vim.diagnostic.goto_next()<CR>')
  buf_map(bufnr, 'n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>')
  buf_map(bufnr, 'n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>')
  buf_map(bufnr, 'n', '<leader>li', ':LspInfo<CR>')
  buf_map(bufnr, 'n', '<leader>lI', ':LspInstallInfo<CR>')

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = 'lsp_document_highlight' }
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
      desc = 'Highlight the word under the cursor',
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
      desc = 'Clear all references',
    })
  end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = cmp_capabilities,
  }

  if server.name == 'sumneko_lua' then
    -- Fix Undefined global 'vim'
    local sumneko_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

local float_config = {
  style = 'minimal',
  source = 'always',
  header = '',
  prefix = '',
  border = 'rounded',
}

vim.diagnostic.config {
  virtual_text = false, -- disable virtual text
  severity_sort = true,
  signs_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  },
  float = float_config,
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, float_config)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)

local null_ls = require 'null-ls'

-- Null-ls - Formatters and Linters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

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

local cmp = require 'cmp'
local luasnip = require 'luasnip'

require('luasnip/loaders/from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },

    -- disable completion with tab
    -- this helps with copilot setup
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'luasnip', priority = 9999 },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
}
