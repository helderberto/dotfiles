vim.o.clipboard = "unnamedplus"               -- Use system clipboard
vim.o.ttyfast = true                          -- Faster redrawing
vim.o.lazyredraw = true                       -- Only redraw when necessary

-- Display
vim.o.cursorline = true                       -- Find the current line quickly.
vim.o.scrolloff = 8                           -- Scroll screen after 8 lines
vim.o.mouse = "a"                             -- Enable mouse support

-- Sidebar
vim.o.number = true                           -- show line numbers
vim.o.relativenumber = true                   -- show line number relative to the current line

-- Search
vim.o.incsearch = true                        -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true                       -- ignore letter case when searching
vim.o.smartcase = true                        -- case insentive unless capitals used in search

vim.o.is = true                               -- Highlight on search
vim.o.title = true                            -- Show title at top of the terminal
vim.o.timeoutlen = 300                        -- VIM hold up 300ms after key press
vim.o.hidden = true                           -- TextEdit might fail if hidden is not set
vim.o.signcolumn = "yes"
vim.o.updatetime = 100                        -- Update delay to 10ms

-- Split natural directions
vim.o.splitbelow = true
vim.o.splitright = true

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldlevelstart = 99                     -- Start file with all folds opened
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Indentation
vim.bo.expandtab = true                        -- turn tabs into tabstop spaces
vim.bo.tabstop = 2                             -- 1 tab = 2 spaces
vim.bo.shiftwidth = 2                          -- shift 2 spaces

-- Empty characters
vim.o.list = true
vim.o.listchars = "eol:¬,space:⋅"

-- Backup files
vim.o.backup = false -- don"t use backup files
vim.o.writebackup = false
vim.o.swapfile = false -- don"t use swap file

-- Theme
vim.o.termguicolors = true                     -- force GUI colors in terminals
vim.cmd [[colorscheme dracula]]

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
