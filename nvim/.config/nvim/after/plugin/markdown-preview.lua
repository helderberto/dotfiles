local map = require('hbb.keymap').map

-- map('n', '<C-s>', '<Plug>MarkdownPreview')
-- map('n', '<M-s>', '<Plug>MarkdownPreviewStop')
map('n', '<leader>pp', '<Plug>MarkdownPreviewToggle')
