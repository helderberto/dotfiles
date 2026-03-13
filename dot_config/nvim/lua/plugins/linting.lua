return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        local ft = vim.bo.filetype
        local linters = lint.linters_by_ft[ft]
        if not linters then return end
        local available = vim.tbl_filter(function(name)
          local l = lint.linters[name]
          return l and type(l.cmd) == 'string' and vim.fn.executable(l.cmd) == 1
        end, linters)
        if #available > 0 then
          lint.try_lint(available)
        end
      end,
    })
  end,
}
