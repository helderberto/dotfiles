-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings:
--------------------

-- Highlight on yank
local yank_augroup = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = yank_augroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 80,
    })
  end,
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ':%s/\\s\\+$//e',
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o',
})

-- nvim 0.12 bundled markdown parser triggers nil range errors via injections;
-- stop treesitter highlighter and fall back to vim syntax
autocmd('FileType', {
  pattern = { 'markdown', 'markdown.mdx' },
  callback = function(args)
    vim.treesitter.stop(args.buf)
  end,
})
