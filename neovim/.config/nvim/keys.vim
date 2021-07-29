"""""""""""""""""""""""""
" => Custom Keys
"""""""""""""""""""""""""

" set leader key to spacebar
let mapleader = "\<space>"

" misc
inoremap <C-c> <esc>

" save & save without format
nnoremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>a
nnoremap <leader>fs <esc>:w<CR>
inoremap <leader>fs <esc>:w<CR>a
nnoremap <leader>fd <esc>:noa w<CR>
inoremap <leader>fd <esc>:noa w<CR>a

" window manipulate
nnoremap <leader>e <C-w>
nnoremap <leader>. :Ex<CR>
nnoremap <leader>ev :Vex!<CR>
nnoremap <leader>es :Sex<CR>

" select & movement

" easy access to the start of the line
nmap 0 ^

" move line up
vnoremap J :m '>+1<CR>gv=gv

" move line down
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>ov :e! ~/.config/nvim/init.vim<CR>

" CoC toggle
nnoremap <leader>cd :CocDisable<CR>
nnoremap <leader>ce :CocEnable<CR>

" buffers & history
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete!<CR>
nnoremap <C-h> :History<CR>

" search
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <leader>pw :BLines<CR>
nnoremap <leader><space> :FZF<CR>
nnoremap <leader>pf :Files %:p:h<CR>
nnoremap <leader>pp :Files ~/workspace<CR>
nnoremap <CR> :noh<CR><CR>

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
