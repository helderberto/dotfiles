" General:
set encoding=utf-8          " The encoding displayed
set fileencoding=utf-8      " The encoding written to file
syntax on                   " Enable syntax highlight
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly.
set relativenumber          " Show relative line numbers
set number                  " Show line numbers
set hlsearch                " Highlight when searching
filetype plugin on          " Enable loading the plugin files for specific file types
set clipboard=unnamed       " Access system clipboard

" Plugins:
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'
Plug 'preservim/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Plugins Configurations:

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

" Syntax Jenkins
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Visual:

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

" Folding
set foldmethod=syntax       " syntax highlighting items specify folds
set foldcolumn=1            " defines 1 col at window left, to indicate folding
set foldlevelstart=99       " start file with all folds opened

" Indentation:
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

" Keymappings:
source ~/.config/nvim/custom/keymappings.vim

" CoC Configuration:
source ~/.config/nvim/custom/coc-config.vim
