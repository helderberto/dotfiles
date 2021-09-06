"""""""""""""""""""""""""
" => Custom Keys
"""""""""""""""""""""""""

" misc
inoremap <C-c> <esc>
nnoremap <esc> :noh<CR><CR>

" save & save without format
nnoremap <C-s> <esc>:w<CR>
nnoremap <C-s>d <esc>:noa w<CR>
nnoremap <leader>w <esc>:w<CR>
nnoremap <leader>we <esc>:noa w<CR>

" window manipulate
nnoremap <leader>. :Ex<CR>
nnoremap <leader>e <C-w>
nnoremap <leader>ev :Vex!<CR>
nnoremap <leader>es :Sex<CR>

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
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fs :BLines<CR>
nnoremap <leader>fd :Files %:p:h<CR>
nnoremap <leader><leader> :FZF<CR>

" Switch between the last two files
nnoremap <leader>l <C-^>

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
