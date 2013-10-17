" Configuration for clojure development
Bundle 'hg::https://bitbucket.org/kovisoft/paredit'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
      \ [ 'darkred',     '-' ],
      \ [ 'darkmagenta', '-' ],
      \ [ 'darkyellow',  '-' ],
      \ [ 'darkcyan',    '-' ],
      \ [ 'darkgreen',   '-' ],
      \ [ 'grey',        '-' ],
      \ [ 'darkgray',    '-' ]
      \ ]
let g:rbpt_max = 7

" Turn on the nice rainbow parentheses but only for round brackets!
autocmd FileType clojure RainbowParenthesesActivate
autocmd Syntax   clojure RainbowParenthesesLoadRound
autocmd FileType clojure set nowrap

" Find it easier to remember 'up' and 'down' for this
autocmd FileType clojure nmap <buffer> <Leader>wu <Leader>I | nmap <buffer> <Leader>wd <Leader>W

" Setup the custom project type behaviour
let projectTypeChecks['project.clj'] = 'leiningen'
autocmd User project-leiningen source $HOME/.vim/portkeys/leiningen.vim
autocmd User project-leiningen call UpdateUniteIgnores()
