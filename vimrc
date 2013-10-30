set nocompatible                  " choose no compatibility with legacy vi
set number                        " show line numbers ...
set relativenumber                " ... and relative line movements
set clipboard=unnamed             " reattach-to-user-space for clipboard
color lucius                      " colour

" Ensure vim files wrap correctly, with comments but not lines!
autocmd FileType vim setlocal textwidth=100 formatoptions=croq

" TODO: Disable syntastic and add a keymapping
" TODO: Fix wrapping width on gitcommit

" Make some keys a bit more useful
noremap ; :
let mapleader = ","
map Y y$

" I spent a load of time messing with this file!
nmap <leader>vr :source $MYVIMRC<cr>
nmap <leader>ve :edit $MYVIMRC<cr>
nmap <leader>vg :!cd $HOME/.vim ; git fetch --all ; git merge origin/master<cr>

"" Remap window movements to something more akin to tmux, which I've got used to!
nnoremap <c-W>- :split<cr>
nnoremap <c-W>\ :vsplit<cr>
nnoremap <c-w>= :ZoomWin<cr>

"" Try to speed up startup time when RVM is installed
let g:ruby_path = system('rvm current')

"" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"" Whitespace
set nowrap                               " don't wrap lines
set tabstop=2 shiftwidth=2 softtabstop=2 " a tab is two spaces
set expandtab                            " use spaces, not tabs
set list                                 " display hidden characters

"" Searching
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj               " Ignore compiled files
set wildignore+=.git,.git/*,.svn,.svn/* " Ignore SCM related files
set wildignore+=*.png,*.gif,*.jpg       " Ignore images files

"" Ctags
command! CTags :!ctags -R

"" Various file type changes
autocmd BufRead,BufNewFile *.txt    set ft=text

" Project type detection ...
source $HOME/.vim/vimrcs/project.vim

"" Rock on with vundle ...
filetype on       " Mac OS X standard vim hack fix
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Plugins that should just be used, always ...
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-unimpaired'
Bundle 'regedarek/ZoomWin'

" Syntastic, needed before various language files loaded
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_enable_ballons=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['gitcommit']
      \}
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>sr :SyntasticReset<cr>

" These plugins have a load of extra stuff around them, so it's nicer to put
" them in separate files.
source $HOME/.vim/vimrcs/portkey.vim
source $HOME/.vim/vimrcs/unite.vim
source $HOME/.vim/vimrcs/git.vim

" Status line configuration ...
Bundle 'bling/vim-airline'
let g:airline_enable_syntastic=1
let g:airline_powerline_fonts=1
set laststatus=2
" ... status line configuration

" General vim enhancements ...
Bundle 'kana/vim-smartinput'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'

Bundle 'plasticboy/vim-markdown'
autocmd FileType text,markdown,mkd setlocal textwidth=100

" UltiSnips setup
Bundle 'SirVer/ultisnips'
let g:UltiSnipsListSnippets = "<s-tab>"
" ... UltiSnips

"" Text objects ...
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-indent'
"" ... Text objects

" Various development environment configurations ...
source $HOME/.vim/vimrcs/web.vim
source $HOME/.vim/vimrcs/clojure.vim

" Plugins I've tried and why they aren't staying, but may come back:
" sjl/gundo.vim - tend to only undo my last change, so not really used it

"" Rock off vundle ...
filetype plugin indent on

"" Sometimes you need to override this behaviour (like at work for instance!)
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Cause individual project type handling to be activated
call DetectProjectType()
