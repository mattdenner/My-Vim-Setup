" Portkey ...
Bundle 'dsawardekar/portkey'

" Provided we stick with a standard way of building portkeys this higher order
" function will allow us to cut down the nasty setup code we have to do!
function! PortKeyHelper(portkey)
  let p = a:portkey
  function! p.get_name() dict
    return self.name
  endfunction
  function! p.get_portkey_path(major, minor) dict
    return self.path . '/' . self.name . '_port_key.json'
  endfunction
  function! p.get_scope() dict
    return self.scope
  endfunction
  function! p.get_finder(a) dict
    return 0
  endfunction
  function! p.get_ranker(a) dict
    return 0
  endfunction
  function! p.get_filters() dict
    return {}
  endfunction
  function! p.get_syntax_files() dict
    return {}
  endfunction
  function! p.configure_inflector(inflector) dict
  endfunction
  function! p.configure_projection(projection) dict
  endfunction
  function! p.get_extractors() dict
    return []
  endfunction

  return p
endfunction
" ... Portkey
