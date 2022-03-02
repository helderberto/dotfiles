" General
set clipboard=unnamedplus          " Use system clipboard
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set number                         " Show line numbers
set relativenumber                 " Show the line number relative to the current line
set hlsearch                       " Highlight when searching
set is                             " Highlight on search
set title                          " Show title at top of the terminal
set timeoutlen=350                 " VIM hold up 350ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set scrolloff=6                    " Scroll screen after 8 lines
set mouse=a                        " Enable mouse support
set signcolumn=yes
set termguicolors                  " Force GUI colors in terminals
set updatetime=100                 " Update delay to 100ms

" More natural split directions
set splitbelow
set splitright

" Fold
set foldmethod=expr
set foldlevelstart=99              " Start file with all folds opened
set foldexpr=nvim_treesitter#foldexpr()

set nowritebackup
set noswapfile
set nobackup

" Indentation
set expandtab                      " turn tabs into tabstop spaces
set tabstop=2                      " 1 tab = 2 spaces
set shiftwidth=2                   " shift 2 spaces

" set leader key to spacebar
let mapleader = "\<space>"

" Custom Syntax

" Enable Groovy syntax into Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Enable JSON syntax into rc files
autocmd BufNewFile,BufRead .*rc setf json

" Apply textwidth to *.md files
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Enable JavaScript / TypeScript syntax when open file
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
