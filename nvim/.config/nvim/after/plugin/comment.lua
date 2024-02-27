local status, comment = pcall(require, 'Comment')
if not status then
  return
end

local ts_context_commentstring = require('ts_context_commentstring.integrations.comment_nvim')

comment.setup({
  -- for commenting tsx and jsx files
  pre_hook = ts_context_commentstring.create_pre_hook(),
})
