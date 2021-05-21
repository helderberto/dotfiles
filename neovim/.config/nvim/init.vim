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

" set FZF layout to bottom window
let g:fzf_layout = { "window": "silent botright 16split enew" }

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

" navigate between directories
nnoremap <leader>pe :Ex<CR>
nnoremap <leader>pv :Vex<CR>

" source neovim configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" fuzzy search files and text
nnoremap <leader><space> :Files<CR>
nnoremap <leader>f :BLines<CR>

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
