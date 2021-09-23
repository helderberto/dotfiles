" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }  " We recommend updating the parsers on update
Plug 'hoob3rt/lualine.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'helderburato/aragorn-vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'JamshedVesuna/vim-markdown-preview'

" Initialize plugin system
call plug#end()

lua require("hbb")

" set leader key to spacebar
let mapleader = "\<space>"

" General
set encoding=utf-8                 " The encoding displayed
set fileencoding=utf-8             " The encoding written to file
syntax on                          " Enable syntax highlight
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set number                         " Show line numbers
set hlsearch                       " Highlight when searching
set is                             " Highlight on search
set title                          " Show title at top of the terminal
filetype plugin indent on          " Enable loading the plugin files for specific file types
set clipboard+=unnamedplus         " Access system clipboard
set timeoutlen=500                 " VIM hold up 500ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set scrolloff=8                    " Scroll screen after 8 lines
set signcolumn=yes                 " Add signcolumn

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

"""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""

" misc
inoremap <C-c> <esc>
nnoremap <esc> :noh<CR><CR>

" Faster saving and exiting
nnoremap <C-s> <esc>:w<CR>
nnoremap <C-s>d <esc>:noa w<CR>
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>we :noa w<CR>
nnoremap <silent><leader>q :q!<CR>

" window manipulate
nnoremap <leader>. :Ex<CR>
nnoremap <leader>e <C-w>
nnoremap <leader>ev :Vex!<CR>
nnoremap <leader>es :Sex<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= <C-w>=<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" select & movement

" easy access to the start of the line
nmap 0 ^

" move line up
vnoremap J :m '>+1<CR>gv=gv

" move line down
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" CoC toggle
nnoremap <leader>cd :CocDisable<CR>
nnoremap <leader>ce :CocEnable<CR>

" buffers & history
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete!<CR>
nnoremap <leader>hh :History<CR>

" search
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fs :BLines<CR>
nnoremap <leader>fd :Files %:p:h<CR>
nnoremap <leader><leader> :FZF<CR>

" Switch between the last two files
nnoremap <leader>l <C-^>

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Tab navigation like Firefox: only 'open new tab' works in terminal
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" tab navigation: Alt or Ctrl+Shift may not work in terminal:
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-t>e :tabedit<space>
nnoremap H gT
nnoremap L gt
" tabs by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" allow `-` to open the parent directory in netrw
nnoremap <silent> - :e %:h<cr>

" vim-fugitive
nmap <leader>gg :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
