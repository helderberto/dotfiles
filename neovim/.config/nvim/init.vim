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

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" file tree
Plug 'preservim/nerdtree'

" prettier
Plug 'sbdchd/neoformat'

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

" copy/paste
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" navigation
nnoremap <leader>pe :Ex<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ph :Sex<CR>

" select and movement
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" source neovim configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" fuzzy search files and text
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><space> :Files<CR>
nnoremap <leader>f :BLines<CR>

" NERDTree remap
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" git
nnoremap <leader>g :Git<CR>

"""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
