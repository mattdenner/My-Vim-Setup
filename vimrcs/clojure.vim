" Configuration for clojure development
Bundle 'tpope/vim-dispatch'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

autocmd User project-leiningen command! Repl Start! lein repl
autocmd User project-leiningen nmap <LocalLeader>R :Repl<cr>
autocmd FileType clojure nmap <LocalLeader>E :Eval<cr>
autocmd FileType clojure nmap <C-]> m`[<C-D> | nmap <C-[> <C-W><C-D>

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

" Use vim-sexp instead of paredit because the behaviour is more understandable
" for me, sort of.  For instance '<LocalLeader>O' and '<LocalLeader>@' look
" similar and do similar-ish, things.  Unfortunately no support for META key
" in the terminal means some remappings.
let g:sexp_mappings = {
      \ 'sexp_capture_prev_element': '<LocalLeader>h',
      \ 'sexp_emit_head_element':    '<LocalLeader>j',
      \ 'sexp_capture_next_element': '<LocalLeader>l',
      \ 'sexp_emit_tail_element':    '<LocalLeader>k',
      \ 'sexp_swap_list_backward':   '<LocalLeader>H',
      \ 'sexp_swap_list_forward':    '<LocalLeader>L'
      \ }
Bundle 'tpope/vim-repeat'
Bundle 'guns/vim-sexp'

" Setup the custom project type behaviour
let g:projectTypeChecks['project.clj'] = 'leiningen'
autocmd User project-leiningen source $HOME/.vim/portkeys/leiningen.vim
autocmd User project-leiningen call UpdateUniteIgnores()
