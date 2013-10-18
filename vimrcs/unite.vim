" Unite setup
" ... note: (cd bundle/vimproc.vim ; make -f make_mac.mak)
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-tag'

" Useful function for updating the Unite ignore pattern.  It takes variable
" arguments thus:
"
" * UpdateUniteIgnores()       - standard + .gitignore
" * UpdateUniteIgnores(1)      - standard + .gitignore
" * UpdateUniteIgnores(0)      - standard
" * UpdateUniteIgnores([x])    - standard + .gitignore + [x]
" * UpdateUniteIgnores([x], 1) - standard + .gitignore + [x]
" * UpdateUniteIgnores([x], 0) - standard + [x]
"
" The .gitignore processing may be utter crap but works for my use cases!
function! UpdateUniteIgnores(...)
  " There are some files you just don't want to open in vim ...
  let unite_ignore_standard = [
        \ '\.git/',
        \ '\.png$', '\.jpg$', '\.gif$', '\.ico$',
        \ 'LICENSE', 'LICENCE'
        \ ]

  " Then there are those that are ignored by git, if we want that ...
  let gitignored = []
  let gitignore  = 1
  if (a:0 == 2)
    echo "SECOND IGNORE"
    let gitignore = a:2
  elseif (a:0 == 1) && (type(a:1) == 0)
    echo "FIRST IGNORE"
    let gitignore = a:1
  endif
  if gitignore
    for r in split(system('cat .gitignore'))
      " Two special cases: recursive match at end, and emacs files
      let r = substitute(r, '\*\*$', '', '')
      let r = substitute(r, '\*\~$', '\\\~$', '') 

      " Handle file extensions, but not directories
      let r = substitute(substitute(r, '^\*\?\(\..*\)$', '\1$', ''), '/\$$', '/', '')

      " Escape all dots as dots!
      call add(gitignored, substitute(r, '\.', '\\.', 'g'))
    endfor
  endif

  " Custom ones can be passed.
  let custom = []
  if (a:0 > 1) && (type(a:1) != 0)
    let custom = a:1
    echo "Custom!"
  endif

  call unite#custom_source(
        \ 'file_rec,file_rec/async,file_mru,file,buffer,grep',
        \ 'ignore_pattern',
        \ join(unite_ignore_standard + gitignored + custom, '\|'))
endfunction

let g:unite_enable_start_insert=1
call unite#custom_source('file_rec,file_rec/async', 'matchers', ['matcher_fuzzy'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep', 'sorters', ['sorter_rank'])
call UpdateUniteIgnores([])

nnoremap <c-f> :Unite -buffer-name=files buffer file_rec<cr>

nnoremap <leader>tag :Unite tag<cr>

nnoremap <leader>ack :Unite grep:.<cr>
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt=''
" ... Unite setup