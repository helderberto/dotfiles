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

" Folding:
set foldmethod=syntax       " syntax highlighting items specify folds
set foldcolumn=1            " defines 1 col at window left, to indicate folding
set foldlevelstart=99       " start file with all folds opened
