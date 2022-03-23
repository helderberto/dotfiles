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
set termguicolors                  " Force GUI colors in terminals
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

" Custom Syntax

" Enable Groovy syntax into Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile setf groovy


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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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

" buffers & history
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>q :Bdelete<CR>
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>L :BufferLineCycleNext<CR>
nnoremap <silent>H :BufferLineCyclePrev<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>bn :BufferLineMoveNext<CR>
nnoremap <silent><leader>bp :BufferLineMovePrev<CR>

" search
nnoremap <leader><leader> :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>fh :Helptags<CR>

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
" => FZF
" https://github.com/junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
endif

" => UltiSnips - https://github.com/SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


"""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-completion (coc.nvim)
" https://github.com/neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""

" enable global extensions
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-json',
      \'coc-yaml',
      \'coc-html',
      \'coc-css',
      \'coc-diagnostic',
      \'coc-sumneko-lua'
      \]

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `dk` and `dj` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent><leader>dk <Plug>(coc-diagnostic-prev)
nmap <silent><leader>dj <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add Prettier usage into current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Fix syntax highlight for Coc plugin floating errors
hi CocErrorFloat guifg=White guibg=Black
