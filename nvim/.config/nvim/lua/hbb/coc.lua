local map = require('hbb.utils').map

-- Auto-completion (coc.nvim)
-- https://github.com/neoclide/coc.nvim

-- Coc packages
--   :CocInstall coc-tsserver
--   :CocInstall coc-json
--   :CocInstall coc-yaml
--   :CocInstall coc-html
--   :CocInstall coc-css
--   :CocInstall coc-diagnostic
--   :CocInstall coc-sumneko-lua
--   :CocInstall coc-prettier
--   :CocInstall coc-eslint

-- Use `dk` and `dj` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "<leader>dk", "<plug>(coc-diagnostic-prev)", {silent = true})
map("n", "<leader>dj", "<plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
map("n", "gd", "<plug>(coc-definition)", {silent = true})
map("n", "gt", "<plug>(coc-type-definition)", {silent = true})
map("n", "gi", "<plug>(coc-implementation)", {silent = true})
map("n", "gr", "<plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window.
map("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})

-- Symbol renaming.
map("n", "<leader>rn", "<Plug>(coc-rename)")

-- Formatting selected code.
map('x', '<leader>f', '<plug>(coc-format-select)')
map('n', '<leader>f', '<plug>(coc-format-select)')

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
map('x', '<leader>a', '<plug>(coc-codeaction-selected)')
map('n', '<leader>a', '<plug>(coc-codeaction-selected)')


-- Remap keys for applying codeAction to the current buffer.
map('n', '<leader>a', '<plug>(coc-codeaction)')

-- Apply AutoFix to problem on the current line.
map('n', '<leader>qf', '<plug>(coc-fix-current)')

vim.cmd [[
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add Prettier usage into current buffer
  command! -nargs=0 Prettier :CocCommand prettier.formatFile

  " Fix syntax highlight for Coc plugin floating errors
  hi CocErrorFloat guifg=White guibg=Black
]]
