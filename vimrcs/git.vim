Bundle 'tpope/vim-fugitive'
nmap <leader>gs :Gstatus<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gg <leader>ack

Bundle 'mhinz/vim-signify'
let g:signify_mapping_next_hunk = ']h'
let g:signify_mapping_prev_hunk = '[h'

let g:signify_sign_color_guifg_add      = '#009900'
let g:signify_sign_color_guifg_delete   = '#ff2222'
let g:signify_sign_color_guifg_change   = '#bbbb00'
let g:signify_sign_color_guibg          = '#363946'
let g:signify_sign_color_ctermfg_add    = 2
let g:signify_sign_color_ctermfg_delete = 1
let g:signify_sign_color_ctermfg_change = 3
let g:signify_sign_color_ctermbg        = 237
