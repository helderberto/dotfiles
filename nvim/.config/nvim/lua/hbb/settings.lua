vim.o.clipboard = 'unnamedplus' -- Use system clipboard
vim.o.cursorline = true -- Find the current line quickly.
vim.o.scrolloff = 8 -- Scroll screen after 8 lines
vim.o.mouse = 'nv' -- Enable mouse support in normal and visual mod
-- vim.o.colorcolumn = '120' -- Highlight column 120
vim.o.number = true -- show line number
vim.o.relativenumber = true -- show line number relative to the current line
vim.o.smartcase = true -- case insentive unless capitals used in search
vim.o.smartindent = true -- make indenting smarter again
vim.o.autoindent = true
vim.o.hlsearch = true -- highlight all matches on previous search pattern
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.incsearch = true -- Show search matches as you typ
vim.o.title = true -- Show title at top of the terminal
vim.o.titlestring = '%<%F%=%l/%L - nvim' -- what the title of the window will be set to
vim.o.hidden = true -- TextEdit might fail if hidden is not set
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.foldmethod = 'expr' -- Folding method (expr, syntax, indent)
vim.o.foldlevelstart = 10 -- Start folded (0 = all unfolded, 99 = all folded)
vim.o.foldexpr = 'nvim_treesitter#foldexpr()' -- Fold based on treesitter syntax
vim.bo.expandtab = true -- Use spaces instead of tabs
vim.bo.tabstop = 2 -- Insert 2 spaces for a tab
vim.bo.shiftwidth = 2 -- Change the number of space characters inserted for indentation
vim.o.list = true -- Show some invisible characters (tabs...)
-- vim.o.listchars = 'eol:¬,space:⋅,tab:>-,trail:~' -- Visible characters for formatting
vim.o.backup = false -- don"t create backup file
vim.o.writebackup = false
vim.o.swapfile = false -- don"t use swap file
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.showmode = false -- Dont show mode since we have a statuslin
vim.o.updatetime = 250 -- Faster completion (default is 4000 ms = 4 s)

-- Show diagnostics on cursor hold (default 500ms)
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, timeout=200})]])
