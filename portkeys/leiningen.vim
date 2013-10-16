" Install the portkey into Portkey so that it can be used
call portkey#add_extension(PortKeyHelper({
      \ 'name': 'leiningen',
      \ 'path': $HOME . '/.vim/portkeys',
      \ 'scope': 'leiningen'
      \ }))
