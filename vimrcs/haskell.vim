Bundle 'dag/vim2hs'
Bundle 'Twinside/vim-hoogle'

let g:projectTypeChecks['Setup.hs'] = 'cabal'
autocmd User project-cabal call UpdateUniteIgnores()

" I'm learning Haskell so having quick access to hoogle is handy.  'fh' uses the
" local hoogle install, which gives quick information.  In normal mode 'fH' simply
" opens the word under the cursor in a browser, but in visual mode it uses the
" selected area (meaning more complicated searches!)
"
" NOTE: For some reason it doesn't redraw properly, hence <c-L> at the end
function! HoogleIt(word)
  " Credit where it's due: pinched, lifted, stolen, from Tim Pope's unimpaired plugin
  " because I couldn't work out how to call his plugin directly!
  let term = substitute(a:word,'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
  execute '!open http://www.haskell.org/hoogle/?hoogle='. substitute(term,'%','\\%','g')
endfunction
autocmd FileType haskell nnoremap <leader>fH "zyw:call HoogleIt(@z)<cr><c-L>
autocmd FileType haskell vnoremap <leader>fH "zy:call HoogleIt(@z)<cr><c-L>
autocmd FileType haskell nnoremap <leader>fh :Hoogle<cr>
