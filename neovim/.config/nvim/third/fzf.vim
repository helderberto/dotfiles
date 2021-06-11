" make FZF respect .gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" set FZF layout to bottom window
let g:fzf_layout = { "window": "silent botright 16split enew" }
