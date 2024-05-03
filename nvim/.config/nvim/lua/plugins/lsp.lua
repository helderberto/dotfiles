return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
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

    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
      return
    end

    require('luasnip/loaders/from_vscode').lazy_load()

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    local kind_icons = {
      Text = '󰀬',
      Method = '󰠄',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰫧',
      Class = '',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰗧',
      Enum = '',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Reference = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = '',
      Event = '',
      Operator = '',
      TypeParameter = '󰊄',
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    -- Disable <Tab> and <S-Tab> mappings

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 4 },
        { name = 'path' },
        { name = 'nvim_lua' },
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
          -- Source
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
            nvim_lua = '[Lua]',
          })[entry.source.name]
          return vim_item
        end,
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    })
  end,
}
