vim.o.clipboard = 'unnamedplus' -- Use system clipboard
vim.o.cursorline = true -- Find the current line quickly.
vim.o.scrolloff = 8 -- Scroll screen after 8 lines
vim.o.mouse = 'a' -- Enable mouse support
vim.o.colorcolumn = '120' -- Highlight column 120
vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- show line number relative to the current line
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search
vim.o.incsearch = true -- Highlight on search
vim.o.title = true -- Show title at top of the terminal
vim.o.timeoutlen = 300 -- VIM hold up 300ms after key press
vim.o.hidden = true -- TextEdit might fail if hidden is not set
vim.o.signcolumn = 'yes'
vim.o.updatetime = 50 -- Update delay to 5ms

-- Split natural directions
vim.o.splitbelow = true
vim.o.splitright = true

-- Folding
vim.o.foldmethod = 'expr'
vim.o.foldlevelstart = 99 -- Start file with all folds opened
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Indentation
vim.bo.expandtab = true -- turn tabs into tabstop spaces
vim.bo.tabstop = 2 -- 1 tab = 2 spaces
vim.bo.shiftwidth = 2 -- shift 2 spaces

vim.o.list = true
vim.o.listchars = 'eol:¬,space:⋅' -- show empty characters
vim.o.backup = false -- don"t use backup files
vim.o.writebackup = false
vim.o.swapfile = false -- don"t use swap file
vim.o.termguicolors = true -- force GUI colors in terminals
vim.cmd 'colorscheme dracula' -- Set colorscheme

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
