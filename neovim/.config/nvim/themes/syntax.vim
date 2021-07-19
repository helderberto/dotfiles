" When enter a JavaScript or TypeScript buffer, and disable when leave
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Jenkins
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" JSON
autocmd BufNewFile,BufRead .*rc setf json

"  Enable Highlight JSDocs
let g:javascript_plugin_jsdoc = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
