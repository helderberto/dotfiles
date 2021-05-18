set scrolloff=8                         " Scroll screen after 8 lines
set number                              " Enable line numbers
set relativenumber                      " Show relative numbers to the current line
set clipboard=unnamed                   " Use the OS default clipboard 
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Load and install Plugins with vim Plug
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
call plug#end()

" Update colorscheme
set termguicolors     " enable true colors support
colorscheme dracula

" Our remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
