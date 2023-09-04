local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

local map = require('hbb.utils').map

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})

function _G.set_terminal_keycaps()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
end

vim.cmd([[autocmd TermOpen * lua set_terminal_keycaps()]])

local Terminal = require('toggleterm.terminal').Terminal

local lagygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
function _G.__lazygit_toggle()
  lagygit:toggle()
end

local node = Terminal:new({ cmd = 'node', hidden = true, direction = 'float' })
function _G.__node_toggle()
  node:toggle()
end

-- Keybindings
map('n', '<leader>lg', '<cmd>lua __lazygit_toggle()<CR>')
map('n', '<leader>nt', '<cmd>lua __node_toggle()<CR>')
