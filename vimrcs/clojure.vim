" Configuration for clojure development
Bundle 'tpope/vim-dispatch'
Bundle 'hg::https://bitbucket.org/kovisoft/paredit'
Bundle 'guns/vim-clojure-static'

" Colour the parentheses in Clojure.
Bundle 'amdt/vim-niji'
let g:niji_clojure_characters = [['(', ')']]
let g:niji_lucius_colours = ['darkgray', 'lightgray', 'lightgreen', 'darkgreen', 'green', 'yellow', 'red']

" Turn on the nice rainbow parentheses but only for round brackets!
autocmd FileType clojure setlocal nowrap textwidth=120 formatoptions=crq

" Find it easier to remember 'up' and 'down' for this
autocmd FileType clojure nmap <buffer> <Leader>wu <Leader>I | nmap <buffer> <Leader>wd <Leader>W

" Setup the custom project type behaviour
let g:projectTypeChecks['project.clj'] = 'leiningen'
autocmd User project-leiningen source $HOME/.vim/portkeys/leiningen.vim
autocmd User project-leiningen call UpdateUniteIgnores()
