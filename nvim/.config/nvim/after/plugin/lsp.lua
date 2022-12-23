local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local lsp_installer = require 'nvim-lsp-installer'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local buf_map = require('hbb.utils').buf_map

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local function lsp_keymaps(bufnr)
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

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      lsp_highlight_document(client)
    end,
    capabilities = lsp_capabilities,
  }

  if server.name == 'sumneko_lua' then
    local sumneko_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
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

local config = {
  virtual_text = false, -- disable virtual text
  signs_icons = {

    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
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
