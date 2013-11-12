" Configuration for clojure development
" Bundle 'tpope/vim-dispatch'
Bundle 'benmills/vimux'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

" When we're in a leiningen project it would be very nice to have a repl available, quickly.
autocmd User project-leiningen command! Repl     call OpenRepl()
autocmd User project-leiningen command! ReplQuit call CloseRepl()
autocmd User project-leiningen autocmd VimLeave * call CloseRepl()
autocmd User project-leiningen nmap <LocalLeader>R :Repl<cr>
autocmd FileType clojure nmap <LocalLeader>E :Eval<cr>
autocmd FileType clojure nmap <C-]> m`[<C-D> | nmap <C-[> <C-W><C-D>

function! OpenRepl()
  call VimuxRunCommand('lein repl')
  call ConnectToRepl()
endfunction

function! CloseRepl()
  call VimuxSendText('quit')
  call VimuxSendKeys('Enter')
  call VimuxCloseRunner()
endfunction

function! ConnectToRepl()
  " We have to wait until the repl is up-and-running before we can identify the port on which to
  " connect fireplace.  We give it a reasonable time to start up.
  " TODO: this sucks, make it better!
  for i in [1,2,3,4,5,6,7,8,9,10]
    if filereadable(glob('.nrepl-port'))
      let nrepl_port = readfile(glob('.nrepl-port'))[0]
      execute ':FireplaceConnect nrepl://127.0.0.1:' . nrepl_port . ' .'
      return
    endif
    sleep 2
  endfor
  echoerr "Cannot connect to the repl"
endfunction

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
