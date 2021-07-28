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
set timeoutlen=300                 " VIM hold up 300ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set shortmess+=c                   " Don't pass messages to |ins-completion-menu|
set scrolloff=8                    " Scroll screen after 8 lines

" Some servers have issues with backup files, see #649.
set nowritebackup
set noswapfile
set nobackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

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

" Theme
set background=dark
set termguicolors
colorscheme gruvbox

" When enter a JavaScript or TypeScript buffer, and disable when leave
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd vimenter * ++nested colorscheme gruvbox

" Jenkins
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" JSON
autocmd BufNewFile,BufRead .*rc setf json

"  Enable Highlight JSDocs
let g:javascript_plugin_jsdoc = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
