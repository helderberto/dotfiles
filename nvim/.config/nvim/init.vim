"""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamed         " Use the OS clipboard by default (on versions compiled with `+clipboard`)
syntax on                     " Enable syntax highlight
set encoding=utf-8            " The encoding displayed
set fileencoding=utf-8        " The encoding written to file
set ttyfast                   " Faster redrawing
set lazyredraw                " Only redraw when necessary
set cursorline                " Highlight current line
set number                    " Enable line numbers
let mapleader=","             " Change mapleader

"""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""

" Default directory ~/.config/nvim/plugged
call plug#begin()

Plug 'dracula/vim'          " Dracula theme
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
