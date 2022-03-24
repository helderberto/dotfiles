"""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
" https://github.com/junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
endif
