" Configuration for web development
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'elzr/vim-json'
autocmd BufRead,BufNewFile *.scss   set ft=scss

let g:projectTypeChecks['bower.json'] = 'yeoman'
autocmd User project-yeoman call UpdateUniteIgnores()
" Just in case: ['app/components/', 'node_modules/', '\.sass-cache/', '\.tmp/']
