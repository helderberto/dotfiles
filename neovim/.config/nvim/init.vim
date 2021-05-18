"""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
syntax on
set ttyfast
set lazyredraw


"""""""""""""""""""""""""
" => Plugins
" => vim-plug - https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""
call plug#begin()

" theme dracula
Plug 'dracula/vim'

" JavaScript Highlight & Improved Indentation
Plug 'pangloss/vim-javascript'

" Typescript Syntax Highlight
Plug 'leafgarland/typescript-vim'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" .editorconfig
Plug 'editorconfig/editorconfig-vim'

" emmet
Plug 'mattn/emmet-vim'

call plug#end()


"""""""""""""""""""""""""
" => Plugins Configs
"""""""""""""""""""""""""
" make FZF respect .gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

"""""""""""""""""""""""""
" => Visual
"""""""""""""""""""""""""
" scroll screen after 8 lines
set scrolloff=8

" enable line numbers
set number

" show relative numbers to the current line
set relativenumber                      

" 256 colors
set t_Co=256

" enable theme Dracula
colorscheme dracula


"""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""
" set leader key to spacebar
let mapleader = " "

" access system clipboard
set clipboard=unnamed

nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>


"""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
