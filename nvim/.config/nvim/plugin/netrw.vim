" netrw
let g:netrw_banner = 0

" allow `-` to open the parent directory in netrw
nnoremap <silent> - :e %:h<cr>
