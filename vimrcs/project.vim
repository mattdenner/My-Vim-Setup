"" Here is a dictionary that maps from a file on disk to the type of project.
"" This is used to check for the presence of these files and then trigger
"" custom behaviour.  It's defined here so that it can be updated in the local
"" vim file if necessary.
let g:projectTypeChecks = {}

" Here's where we check for the presence of files and signal the project type
function! DetectProjectType()
  for [f,t] in items(g:projectTypeChecks)
    if filereadable(getcwd() . '/' . f)
      execute 'silent doautocmd User project-'.t
      break
    endif
  endfor
endfunction
