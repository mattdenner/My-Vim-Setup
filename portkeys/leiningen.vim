" Support leiningen projects through portkey
let LeiningenPortKey = {
      \ 'name': 'leiningen',
      \ 'path': $HOME . '/.vim/portkeys',
      \ 'scope': 'leiningen'
      \ }
function! LeiningenPortKey.get_name() dict
  return self.name
endfunction
function! LeiningenPortKey.get_portkey_path(major, minor) dict
  return self.path . '/leiningen_port_key.json'
endfunction
function! LeiningenPortKey.get_scope() dict
  return self.scope
endfunction
function! LeiningenPortKey.get_finder(a) dict
  return 0
endfunction
function! LeiningenPortKey.get_ranker(a) dict
  return 0
endfunction
function! LeiningenPortKey.get_filters() dict
  return {}
endfunction
function! LeiningenPortKey.get_syntax_files() dict
  return {}
endfunction
function! LeiningenPortKey.configure_inflector(inflector) dict
endfunction
function! LeiningenPortKey.configure_projection(projection) dict
endfunction
function! LeiningenPortKey.get_extractors() dict
  return []
endfunction

" Install the portkey into Portkey so that it can be used
call portkey#add_extension(LeiningenPortKey)
