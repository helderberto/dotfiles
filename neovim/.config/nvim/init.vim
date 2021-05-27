"""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""

set encoding=utf-8          " The encoding displayed
set fileencoding=utf-8      " The encoding written to file
syntax on                   " Enable syntax highlight
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly.
set relativenumber          " Show relative line numbers
set number                  " Show line numbers
filetype plugin on          " Enable loading the plugin files for specific file types


"""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" CoC - Conquer of Completion
" Base of my CoC configs - https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""

" enable highlight for JSDocs
let g:javascript_plugin_jsdoc = 1

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

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" When enter a JavaScript or TypeScript buffer, and disable when leave
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


"""""""""""""""""""""""""
" => Visual
"""""""""""""""""""""""""

" 256 colors
set t_Co=256

" enable theme Dracula
colorscheme dracula

" scroll screen after 8 lines
set scrolloff=8

" show the status line all the time
set laststatus=2

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

" map C-s to save files in normal and insert modes
nnoremap <silent> <C-s> <esc>:w<CR>
inoremap <silent> <C-s> <esc>:w<CR>a

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
nnoremap <leader>t :NERDTreeToggle<CR>

" fzf configurations
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sf :Rg<CR>
nnoremap <leader>sb :BLines<CR>
nnoremap <leader><space> :FZF<CR>
nnoremap <C-p> :FZF<CR>

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

" Git
nmap <leader>g :G<CR>

" CoC toggle
nnoremap <leader>cd :CocDisable<CR>
nnoremap <leader>ce :CocEnable<CR>


"""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent


"""""""""""""""""""""""""
" => Auto-completion (CoC.nvim)
"""""""""""""""""""""""""

" enable global extensions
let g:coc_global_extensions = [
\ 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin',
\ 'coc-css', 'coc-json', 'coc-yaml', 'coc-emoji'
\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
