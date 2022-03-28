"""""""""""""""""""""""""""""""""""""""""""""""
" => Fern
" https://github.com/lambdalisue/fern.vim
"""""""""""""""""""""""""""""""""""""""""""""""

" Custom settings and mappings.
function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> r <Plug>(fern-action-reload)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Show hidden files and directories
let g:fern#default_hidden = 1

" Key mappings
nnoremap <silent> <leader>. :Fern . -reveal=%<CR><C-w>=
nnoremap <silent> <leader>n :Fern %:h -drawer -width=35<CR><C-w>=

" https://github.com/antoinemadec/FixCursorHold.nvim#configuration
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
