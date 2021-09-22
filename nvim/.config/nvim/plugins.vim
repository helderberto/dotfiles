" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

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

" Reload .vimrc or init.vim and :PlugInstall to install plugins.
