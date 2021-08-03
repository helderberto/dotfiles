" set leader key to spacebar
let mapleader = "\<space>"

" General
set encoding=utf-8                 " The encoding displayed
set fileencoding=utf-8             " The encoding written to file
syntax on                          " Enable syntax highlight
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set relativenumber                 " Show relative line numbers
set number                         " Show line numbers
set hlsearch                       " Highlight when searching
set is                             " Highlight on search
set title                          " Show title at top of the terminal
filetype plugin indent on          " Enable loading the plugin files for specific file types
set clipboard=unnamed              " Access system clipboard
set timeoutlen=500                 " VIM hold up 500ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set scrolloff=8                    " Scroll screen after 8 lines
set signcolumn=no                  " Remove signcolumn

" Some servers have issues with backup files, see #649.
set nowritebackup
set noswapfile
set nobackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Indentation
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set smartindent

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set textwidth=80

" Folding
set foldmethod=syntax       " syntax highlighting items specify folds
set foldlevelstart=99       " start file with all folds opened

" Theme
if (has("termguicolors"))
  set termguicolors
endif

colorscheme nord

" When enter a JavaScript or TypeScript buffer, and disable when leave
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Jenkins
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" JSON
autocmd BufNewFile,BufRead .*rc setf json

"  Enable Highlight JSDocs
let g:javascript_plugin_jsdoc = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Apply textwidth to *.md files
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
