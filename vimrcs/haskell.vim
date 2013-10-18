Bundle 'dag/vim2hs'

let g:projectTypeChecks['Setup.hs'] = 'cabal'
autocmd User project-cabal call UpdateUniteIgnores()
