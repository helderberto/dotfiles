" make emmet behave well with JSX in JS and TS files
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" https://github.com/mattn/emmet-vim#redefine-trigger-key
let g:user_emmet_leader_key='<tab>'
