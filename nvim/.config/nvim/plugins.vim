" Plugins
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
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'lambdalisue/fern.vim'
Plug 'folke/zen-mode.nvim'

" Initialize plugin system
call plug#end()
