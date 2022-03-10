" Mappings

" misc
inoremap <C-c> <esc>
nnoremap <esc> :noh<CR><CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>we :noa w<CR>
nnoremap <silent><leader>q :q!<CR>

" window manipulate
nnoremap <silent> <leader>. :Fern . -reveal=%<CR><C-w>=
nnoremap <silent> <leader>n :Fern . -drawer -width=40 -reveal=% -toggle<CR><C-w>=
nnoremap <leader>e <C-w>
nnoremap <leader>ev :vsplit<CR>
nnoremap <leader>es :split<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= <C-w>=<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" select & movement

" move line up
vnoremap J :m '>+1<CR>gv=gv

" move line down
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" buffers & history
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>bd :bdelete!<CR>
nnoremap <leader>h :History<CR>

" search
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fs :BLines<CR>
nnoremap <leader>fd :Files %:p:h<CR>
nnoremap <leader><leader> :FZF<CR>

" Switch between the last two files
nnoremap <leader>l <C-^>

" Quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction

nnoremap <leader>co :call ToggleQuickFix()<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cr :cfdo %s/

" Replace

" Replace current selected word
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <leader>r :%s//g<Left><Left>
nnoremap <leader>rr :%s//gc<Left><Left><Left>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Git
nmap <leader>g :G<CR>
nmap <leader>dh :diffget //2<CR>
nmap <leader>dl :diffget //3<CR>

" Zen Mode
nnoremap <leader>zm :ZenMode<cr>
