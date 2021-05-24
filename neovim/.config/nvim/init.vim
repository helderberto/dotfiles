"""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""

set encoding=utf-8              " The encoding displayed
set fileencoding=utf-8          " The encoding written to file
syntax on                       " Enable syntax highlight
set ttyfast                     " Faster redrawing
set lazyredraw                  " Only redraw when necessary
set cursorline                  " Find the current line quickly
set laststatus=2                " Always show status line
set ai                          " AutoIndent


"""""""""""""""""""""""""
" => Plugins
" => vim-plug - https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""

call plug#begin()

Plug 'dracula/vim'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


"""""""""""""""""""""""""
" => Configuring Plugins
"""""""""""""""""""""""""

" When writing a buffer (no delay).
" https://github.com/neomake/neomake#setup
call neomake#configure#automake('w')

" enable highlight for JSDocs
let g:javascript_plugin_jsdoc = 1

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert and normal modes
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use emojis for errors and warnings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier']
\}

" linter configurations
let g:ale_linters = {
\   'javascript': ['eslint']
\}

" make emmet behave well with JSX in JS and TS files
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" make FZF respect .gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" set FZF layout to bottom window
let g:fzf_layout = { "window": "silent botright 16split enew" }



"""""""""""""""""""""""""
" => Visual
"""""""""""""""""""""""""

" 256 colors
set t_Co=256

" enable theme Dracula
colorscheme dracula

" scroll screen after 8 lines
set scrolloff=8

" enable line numbers
set number

" show relative numbers to the current line
set relativenumber

" follow terminal background
hi Normal ctermbg=none


"""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""

" set leader key to spacebar
let mapleader = "\<space>"

" access system clipboard
set clipboard=unnamed

" copy/paste
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" manipulate window
nnoremap <leader>. :Ex<CR>
nnoremap <leader>we :Ex<CR>
nnoremap <leader>w <C-w>
nnoremap <leader>wv :Vex<CR>
nnoremap <leader>ws :Sex<CR>

" select and movement
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so %<CR>

" NERDTree remap
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" fzf configurations
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>sf :Rg<CR>
nnoremap <leader>sb :BLines<CR>
nnoremap <leader><space> :Files<CR>

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" buffers/files history
nnoremap <leader>h :History<CR>

"""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab


"""""""""""""""""""""""""
" => Auto-completion (CoC.nvim)
"""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" always show signcolumn
set signcolumn=yes

let g:coc_global_extensions = [
\ 'coc-emoji', 'coc-eslint', 'coc-prettier',
\ 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin',
\ 'coc-css', 'coc-json', 'coc-rls', 'coc-yaml'
\ ]

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


"""""""""""""""""""""""""
" => Git
"""""""""""""""""""""""""

nmap <leader>g :G<CR>
