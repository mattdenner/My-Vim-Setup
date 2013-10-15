set nocompatible  " choose no compatibility with legacy vi
set number
set ruler
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set autoread                    " reload files that have change on disk but not in buffer
let mapleader = ","             " remap the leader

nmap <leader>vr :source $MYVIMRC<cr>
nmap <leader>ve :edit $MYVIMRC<cr>
nmap <leader>vg :!cd $HOME/.vim ; git fetch --all ; git merge origin/master<cr>

"" Rock on with vundle ...
filetype on       " Mac OS X standard vim hack fix
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"" Here are the plugins (don't comment inline as vundle doesn't like that!)
" ... General vim enhancements ...
Bundle 'kana/vim-smartinput'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'

" Keep the behaviour of window zooming in vim close to that of tmux
Bundle 'regedarek/ZoomWin'
nnoremap <c-w>= :ZoomWin<cr>

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-dispatch'

Bundle 'plasticboy/vim-markdown'
autocmd FileType text,markdown,mkd  setlocal wrapmargin=20 | setlocal linebreak | setlocal wrap  " Ensure wrapping happens properly for text & markdown

" Unite setup
" ... note: (cd bundle/vimproc.vim ; make -f make_mac.mak)
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-tag'
call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy'])
let g:unite_enable_start_insert=1
nnoremap <c-f> :Unite -buffer-name=files buffer file_rec/async:!<cr>
nnoremap <leader>tag :Unite tag<cr>
nnoremap <leader>ack :Unite grep:.<cr>
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt=''
" ... Unite setup

"" Text objects ...
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-indent'
"" ... Text objects

" Git ...
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
" .. Git

" Status line configuration ...
Bundle 'bling/vim-airline'
let g:airline_enable_syntastic=0
let g:airline_powerline_fonts=1
set laststatus=2
" ... status line configuration

" HTML + Javascript ...
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'juvenn/mustache.vim'
autocmd BufRead,BufNewFile *.json   set ft=javascript
autocmd BufRead,BufNewFile *.scss   set ft=scss
" ... HTML + Javascript

"" Rock off vundle ...
filetype plugin indent on

"" Appearance
color lucius                " jellybeans is good too
hi SignColumn      guifg=#818698 guibg=#363946 ctermfg=102 ctermbg=237 gui=none cterm=none

"" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"" Whitespace
set nowrap                               " don't wrap lines
set tabstop=2 shiftwidth=2 softtabstop=2 " a tab is two spaces
set expandtab                            " use spaces, not tabs
set backspace=indent,eol,start           " backspace through everything in insert mode

"" Whitespace characters
set list                   " display hidden characters
set listchars=""           " Reset the listchars
set listchars=tab:\~\~     " show tabs as '~~'
set listchars+=trail:.     " show trailing spaces as dots
set listchars+=extends:>   " show when the line goes off the right of the window
set listchars+=precedes:<  " show when the line goes off the left of the window

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Ctags
command! CTags :!ctags -R

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj               " Ignore compiled files
set wildignore+=.git,.git/*,.svn,.svn/* " Ignore SCM related files
set wildignore+=*.png,*.gif,*.jpg       " Ignore images files

"" Trying out reattach-to-user-namespace
set clipboard=unnamed

"" Various file type changes
autocmd BufRead,BufNewFile *.txt    set ft=text

"" Map some keys
map Y y$

"" Remap window movements to something more akin to tmux, which I've got used to!
nmap <c-W>- :split<cr>
nmap <c-W>\ :vsplit<cr>

"" Try to speed up startup time when RVM is installed
let g:ruby_path = system('rvm current')

"" Here is a dictionary that maps from a file on disk to the type of project.
"" This is used to check for the presence of these files and then trigger
"" custom behaviour.  It's defined here so that it can be updated in the local
"" vim file if necessary.
let projectTypeChecks = {}

"" Sometimes you need to override this behaviour (like at work for instance!)
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Here's where we check for the presence of files and signal the project type
for [f,t] in items(projectTypeChecks)
  if filereadable(getcwd() . '/' . f)
    execute 'silent doautocmd User project-'.t
    break
  endif
endfor
