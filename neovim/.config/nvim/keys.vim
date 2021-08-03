"""""""""""""""""""""""""
" => Custom Keys
"""""""""""""""""""""""""

" misc
inoremap <C-c> <esc>
nnoremap <esc> :noh<CR><CR>

" save & save without format
nnoremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>a
nnoremap <leader>fs <esc>:w<CR>
inoremap <leader>fs <esc>:w<CR>a
nnoremap <leader>fd <esc>:noa w<CR>
inoremap <leader>fd <esc>:noa w<CR>a

" window manipulate
nnoremap <leader>w <C-w>
nnoremap <leader>. :Ex<CR>
nnoremap <leader>wv :Vex!<CR>
nnoremap <leader>ws :Sex<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" select & movement

" easy access to the start of the line
nmap 0 ^

" move line up
vnoremap J :m '>+1<CR>gv=gv

" move line down
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>ec :e! ~/.config/nvim/init.vim<CR>

" CoC toggle
nnoremap <leader>cd :CocDisable<CR>
nnoremap <leader>ce :CocEnable<CR>

" buffers & history
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete!<CR>
nnoremap <leader>hh :History<CR>

" search
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <leader>pb :BLines<CR>
nnoremap <leader>pf :FZF<CR>
nnoremap <leader>pc :Files %:p:h<CR>

" Switch between the last two files
nnoremap <leader>t <C-^>

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
