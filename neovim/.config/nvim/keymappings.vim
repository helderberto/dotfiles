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
nnoremap <leader>w <C-w>
nnoremap <leader>wv :Vex<CR>
nnoremap <leader>ws :Sex<CR>

" select and movement
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so %<CR>

" fzf configurations
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sr :Rg<CR>
nnoremap <leader>sb :BLines<CR>
nnoremap <leader><space> :FZF<CR>

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

" quit
nmap <leader>q :q!<CR>
