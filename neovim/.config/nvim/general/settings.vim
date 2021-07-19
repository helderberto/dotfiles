set encoding=utf-8                 " The encoding displayed
set fileencoding=utf-8             " The encoding written to file
syntax on                          " Enable syntax highlight
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set relativenumber                 " Show relative line numbers
set number                         " Show line numbers
set hlsearch                       " Highlight when searching
set title                          " Show title at top of the terminal
filetype plugin indent on          " Enable loading the plugin files for specific file types
set clipboard=unnamed              " Access system clipboard
set timeoutlen=500                 " VIM hold up 500ms after key press

" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

" Folding
set foldmethod=syntax       " syntax highlighting items specify folds
set foldlevelstart=99       " start file with all folds opened
