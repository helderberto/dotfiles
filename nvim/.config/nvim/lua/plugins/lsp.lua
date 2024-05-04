return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
  },

  config = function()
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero
    local lsp_zero = require('lsp-zero')

    lsp_zero.configure('lua_ls', {
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
        },
      },
    })

    lsp_zero.set_preferences({
      sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
      },
    })

    lsp_zero.setup()

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'eslint',
        'cssls',
        'html',
        'jsonls',
        'elixirls',
        'gopls',
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    vim.diagnostic.config({
      virtual_text = true,
      underline = true,
    })

    local lsp = require('lsp-zero')

    lsp.on_attach(function(_, bufnr)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
        buffer = bufnr,
        desc = 'Goto Definition',
      })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
        buffer = bufnr,
        desc = 'Goto declaration',
      })
      vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Goto implementation' })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
        buffer = bufnr,
        desc = 'Goto references',
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
        buffer = bufnr,
        desc = 'Hover',
      })
      vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {
        buffer = bufnr,
        desc = 'Rename',
      })
      vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, {
        buffer = bufnr,
        desc = 'Goto previous diagnostic',
      })
      vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, {
        buffer = bufnr,
        desc = 'Goto next diagnostic',
      })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
      vim.keymap.set('n', '<leader>gK', vim.lsp.buf.signature_help, {
        buffer = bufnr,
        desc = 'Signature Help',
      })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {
        buffer = bufnr,
        desc = 'Signature Help',
      })
      vim.keymap.set('n', '<leader>li', ':LspInfo<CR>', {
        buffer = bufnr,
        desc = 'LSP Info',
      })
    end)

    -- Mason
    vim.keymap.set('n', '<leader>lI', ':Mason<cr>', { desc = 'Mason' })
  end,
}
