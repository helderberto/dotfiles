-- Base
vim.o.clipboard = "unnamedplus"
vim.o.title = true

-- Display
vim.o.scrolloff = 6
vim.o.mouse = "a" -- enable cursor
vim.o.cursorline = true

-- Performance
vim.o.ttyfast = true -- faster redrawing
vim.o.lazyredraw = true -- only redraw when necessary

-- Sidebar
vim.o.number = true
vim.o.relativenumber = true -- show line number relative to the current
vim.o.signcolumn = "yes"

-- Search
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search

-- Waiting time
vim.o.timeoutlen = 350 -- hold up 350ms after key press
vim.o.updatetime = 100 -- update delay to 10ms

-- Split directions
vim.o.splitbelow = true
vim.o.splitright = true

-- Fold
vim.o.foldmethod = "expr"
vim.o.foldexpr="nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- Backup files
vim.o.backup = false -- don"t use backup files
vim.o.writebackup = false
vim.o.swapfile = false -- don"t use swap file

-- Indentation
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.o.list = true
vim.o.listchars = "eol:¬,space:⋅"

-- Custom file syntax
vim.cmd [[
  au BufNewFile,BufRead Jenkinsfile       setf groovy
  au BufNewFile,BufRead .*rc              setf json
  au BufRead,BufNewFile *.md              setlocal textwidth=80
  au BufEnter *.{js,jsx,ts,tsx}           set syntax sync fromstart
  au BufLeave *.{js,jsx,ts,tsx}           set syntax sync clear
]]

-- Theme
vim.o.termguicolors = true
vim.cmd [[colorscheme dracula]]

-- Fern
vim.cmd [[
  " Custom settings and mappings.
  function! FernInit() abort
    nmap <buffer><expr>
          \ <Plug>(fern-my-open-expand-collapse)
          \ fern#smart#leaf(
          \   "\<Plug>(fern-action-open:select)",
          \   "\<Plug>(fern-action-expand)",
          \   "\<Plug>(fern-action-collapse)",
          \ )
    nmap <buffer> n <Plug>(fern-action-new-path)
    nmap <buffer> d <Plug>(fern-action-remove)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> M <Plug>(fern-action-rename)
    nmap <buffer> r <Plug>(fern-action-reload)
  endfunction

  augroup FernGroup
    autocmd!
    autocmd FileType fern call FernInit()
  augroup END
]]

vim.g["fern#default_hidden"] = 1

-- Snippets
vim.g["UltiSnipsExpandTrigger"] = "<tab>"
vim.g["UltiSnipsJumpForwardTrigger"] = "<tab>"
vim.g["UltiSnipsJumpBackwardTrigger"] = "<c-b>"

-- Emmet
vim.g.user_emmet_leader_key = '<tab>'
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  },
  typescript = {
    extends = 'tsx'
  }
}
