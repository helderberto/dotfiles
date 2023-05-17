-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md
local lsp = require('lsp-zero')
local map = require('hbb.utils').map

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'cssls',
  'html',
  'jsonls',
  'elixirls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
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

-- Mason
map('n', '<leader>lI', ':Mason<cr>', { desc = 'Mason' })

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'nvim_lua' },
  },
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = { 'menu', 'abbr', 'kind' },
    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

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

local null_ls = require('null-ls')

local null_opts = lsp.build_options('null-ls', {
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
  end,
})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
  debug = true,
  on_attach = null_opts.on_attach,
  sources = {
    -- formatting
    formatting.prettier,
    formatting.stylua, -- Lua

    -- linting
    lint.eslint,
    lint.credo,   -- Elixir
    lint.rubocop, -- Ruby

    -- code actions
    action.eslint,
  },
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
})
