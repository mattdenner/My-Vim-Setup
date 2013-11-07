" Configuration for clojure development
Bundle 'tpope/vim-dispatch'
Bundle 'hg::https://bitbucket.org/kovisoft/paredit'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

" Colour the parentheses in Clojure.  Especially those over a certain depth because it
" hints at there being something crap in the code.
let g:niji_clojure_characters = [['(', ')']]
let g:niji_lucius_colours = [
      \ 'darkgray', 'lightgray',
      \ 'lightgreen', 'darkgreen', 'green',
      \ 'yellow',
      \ 'red', 'red', 'red', 'red', 'red'
      \ ]
Bundle 'amdt/vim-niji'

" Turn on the nice rainbow parentheses but only for round brackets!
autocmd FileType clojure setlocal nowrap textwidth=120 formatoptions=crq

" Directional movements feel better for parentheses handling
autocmd FileType clojure nmap <buffer> <Leader>wk <Leader>I |
      \ nmap <buffer> <Leader>wj <Leader>W |
      \ nmap <buffer> <Leader>wl <Leader>> |
      \ nmap <buffer> <Leader>wh <Leader>< |
      \ vmap <buffer> <Leader>wj <Leader>W

" Setup the custom project type behaviour
let g:projectTypeChecks['project.clj'] = 'leiningen'
autocmd User project-leiningen source $HOME/.vim/portkeys/leiningen.vim
autocmd User project-leiningen call UpdateUniteIgnores()
autocmd User project-leiningen command! Repl Start! lein repl
