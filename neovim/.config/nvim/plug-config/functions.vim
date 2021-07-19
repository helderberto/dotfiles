fun! ChooseBuffer()
  redir => buffers
    silent ls
  redir end

  echo l:buffers
  let l:choice = input('Which one: ')
  execute ':edit +' . l:choice . 'buf'
endfun
