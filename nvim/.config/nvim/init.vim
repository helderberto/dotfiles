"""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""

" set leader key to spacebar
let mapleader = "\<space>"

set clipboard=unnamedplus          " Use system clipboard
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set number                         " Show line numbers
set relativenumber                 " Show the line number relative to the current line
set hlsearch                       " Highlight when searching
set is                             " Highlight on search
set title                          " Show title at top of the terminal
set timeoutlen=350                 " VIM hold up 350ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set scrolloff=6                    " Scroll screen after 8 lines
set mouse=a                        " Enable mouse support
set signcolumn=yes
set updatetime=100                 " Update delay to 10ms
set splitbelow
set splitright
set foldmethod=expr
set foldlevelstart=99              " Start file with all folds opened
set foldexpr=nvim_treesitter#foldexpr()
set nowritebackup
set noswapfile
set nobackup
set expandtab                      " turn tabs into tabstop spaces
set tabstop=2                      " 1 tab = 2 spaces
set shiftwidth=2                   " shift 2 spaces


"""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hoob3rt/lualine.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'helderburato/aragorn-vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'moll/vim-bbye'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""
" => Load Lua Configuration (./luba/hbb)
"""""""""""""""""""""""""""""""""""""""""""""""
lua require("hbb")

"""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Related Configs
"""""""""""""""""""""""""""""""""""""""""""""""

" toggle invisible characters
set invlist
set list
set listchars=tab:¦\ ,eol:¬,trail:⋅,extends:❯,precedes:❮


"""""""""""""""""""""""""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""

" misc
inoremap <C-c> <esc>
nnoremap <esc> :noh<CR><CR>

" Faster saving and exiting
nnoremap <leader>w :w!<CR>
nnoremap <leader>we :noa w<CR>
nnoremap <leader>we :noa w<CR>
inoremap <leader>qq <esc>:qa!<cr>
nnoremap <leader>qq :qa!<cr>

" window manipulate
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>re :NvimTreeRefresh<CR>
nnoremap <leader>. :NvimTreeFindFile<CR>
nnoremap <leader>e <C-w>
nnoremap <leader>ev :vsplit<CR>
nnoremap <leader>es :split<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= <C-w>=<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" select & movement

" move line up
vnoremap J :m '>+1<CR>gv=gv

" move line down
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" search (history, buffers)
nnoremap <leader><leader> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <C-b> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>q :Bdelete<CR>

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>L :BufferLineCycleNext<CR>
nnoremap <silent>H :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>bn :BufferLineMoveNext<CR>
nnoremap <silent><leader>bp :BufferLineMovePrev<CR>

" Switch between the last two files
nnoremap <leader>l <C-^>

" Quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction

nnoremap <leader>co :call ToggleQuickFix()<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cr :cfdo %s/

" Replace

" Replace current selected word
vnoremap <C-r> "hy:%s/\<<C-r><C-w>\>//gc<left><left><left>
vnoremap <leader>r "hy:%s/\<<C-r><C-w>\>//gc<left><left><left>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <leader>rr :%s//gc<Left><Left><Left>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Git
nmap <leader>g :G<CR>
nmap <leader>dh :diffget //2<CR>
nmap <leader>dl :diffget //3<CR>


"""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet
" https://github.com/mattn/emmet-vim
"""""""""""""""""""""""""""""""""""""""""""""""

" make emmet behave well with JSX in JS and TS files
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" https://github.com/mattn/emmet-vim#redefine-trigger-key
let g:user_emmet_leader_key='<tab>'


"""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
" https://github.com/SirVer/ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
