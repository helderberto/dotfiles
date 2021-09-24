" Initialization
set encoding=utf-8
filetype plugin indent on

augroup hbb
  autocmd!
augroup

runtime plugins.vim

lua require("hbb")

" General
set fileencoding=utf-8             " The encoding written to file
set clipboard=unnamedplus          " Use system clipboard
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set number                         " Show line numbers
set hlsearch                       " Highlight when searching
set is                             " Highlight on search
set title                          " Show title at top of the terminal
set timeoutlen=500                 " VIM hold up 500ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set scrolloff=6                    " Scroll screen after 8 lines
set signcolumn=yes                 " Add signcolumn
set termguicolors                  " Force GUI colors in terminals
set foldmethod=syntax              " Syntax highlighting items specify folds
set foldlevelstart=99              " Start file with all folds opened
set updatetime=100                 " Update delay to 100ms

set nowritebackup
set noswapfile
set nobackup

" Indentation
set smartindent
set autoindent                     " open lines at same indentation
set expandtab                      " turn tabs into tabstop spaces
set tabstop=2                      " 1 tab = 2 spaces
set shiftwidth=2                   " shift 2 spaces

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Mappings
" set leader key to spacebar
let mapleader = "\<space>"

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

augroup hbb
  " Enable Groovy syntax into Jenkinsfile
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy

  " Enable JSON syntax into rc files
  autocmd BufNewFile,BufRead .*rc setf json

  " Automatically removing all trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  " Apply textwidth to *.md files
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Enable JavaScript / TypeScript syntax when open file
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END
