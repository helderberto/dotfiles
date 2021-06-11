"""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""

" set leader key to spacebar
let mapleader = "\<space>"

" copy/paste
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" map C-s to save files in normal and insert modes
nnoremap <silent> <C-s> <esc>:w<CR>
inoremap <silent> <C-s> <esc>:w<CR>a
nnoremap <silent> <leader>fs <esc>:w<CR>
inoremap <silent> <leader>fs <esc>:w<CR>a

" save without format with prettier
nnoremap <silent> <leader>fd <esc>:noa w<CR>
inoremap <silent> <leader>fd <esc>:noa w<CR>a

" manipulate window
nnoremap <silent> <leader>. :Ex<CR>
nnoremap <silent> <leader>w <C-w>
nnoremap <silent> <leader>wv :Vex<CR>
nnoremap <silent> <leader>ws :Sex<CR>

" select and movement
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" fzf & search
nnoremap <silent> <leader>sg :GFiles<CR>
nnoremap <silent> <leader>sr :Rg<CR>
nnoremap <silent> <leader>sb :BLines<CR>
nnoremap <silent> <leader><space> :FZF<CR>
nnoremap <silent> <leader>/ :noh<CR>

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
nnoremap <silent> <leader>h :History<CR>

" CoC toggle
nnoremap <leader>cd :CocDisable<CR>
nnoremap <leader>ce :CocEnable<CR>

" force quit
nmap <leader>q :q!<CR>

" buffers
command! ChooseBuffer call ChooseBuffer()
nnoremap <silent> <leader>b :call ChooseBuffer()<CR>
nnoremap <silent> <leader>hh :bprevious<CR>
nnoremap <silent> <leader>ll :bnext<CR>
