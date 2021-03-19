"""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""

syntax on                   " Enable syntax highlight
set encoding=utf-8          " The encoding displayed
set fileencoding=utf-8      " The encoding written to file
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly.
set number
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""

" Default directory ~/.config/nvim/plugged
call plug#begin()

Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
