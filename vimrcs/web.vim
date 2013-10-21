" Configuration for web development
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'elzr/vim-json'
autocmd BufRead,BufNewFile *.scss   set ft=scss

" Ensure that Javascript files format correctly and that syntastic is passive
" for them because it slows down the flow of development.
autocmd FileType javascript setlocal textwidth=100 formatoptions=crq
call add(g:syntastic_mode_map['passive_filetypes'], 'javascript')

let g:projectTypeChecks['bower.json'] = 'yeoman'
autocmd User project-yeoman call UpdateUniteIgnores()
" Just in case: ['app/components/', 'node_modules/', '\.sass-cache/', '\.tmp/']
