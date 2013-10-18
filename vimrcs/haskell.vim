Bundle 'dag/vim2hs'

let projectTypeChecks['Setup.hs'] = 'cabal'
autocmd User project-cabal call UpdateUniteIgnores()
