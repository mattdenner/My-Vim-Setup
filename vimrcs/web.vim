" Configuration for web development
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'juvenn/mustache.vim'
autocmd BufRead,BufNewFile *.json   set ft=javascript
autocmd BufRead,BufNewFile *.scss   set ft=scss

let projectTypeChecks['bower.json'] = 'yeoman'
autocmd User project-yeoman call UpdateUniteIgnores(['app/components/', 'node_modules/', '\.sass-cache/', '\.tmp/'])
