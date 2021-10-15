" Enable Groovy syntax into Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Enable JSON syntax into rc files
autocmd BufNewFile,BufRead .*rc setf json

" Apply textwidth to *.md files
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Enable JavaScript / TypeScript syntax when open file
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
