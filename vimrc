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

"" Rock on with vundle ...
filetype on       " Mac OS X standard vim hack fix
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"" Here are the plugins (don't comment inline as vundle doesn't like that!)
" ... General vim enhancements ...
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'NickLaMuro/vimux'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'

"" CtrlP setup
let g:ctrlp_working_path_mode = 0                                " work with the current directory of the vim session
let g:ctrlp_clear_cache_on_exit = 1                              " clear the cache of filenames on exit
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp_cache'                " store the cache within the vim directory
let g:ctrlp_dotfiles = 0                                         " don't search directories or files that start with '.'
let g:ctrlp_max_depth = 10                                       " don't search deeper than 10 levels
let g:ctrlp_mruf_relative = 1                                    " only work from the relative directory
let g:ctrlp_extensions = ['buffertag', 'tag']
let g:ctrlp_mruf_max = 1000                                      " remember 1000 files
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': [ '<c-r>' ] } " F5 doesn't work on Leopard so remap it
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " use git 'cos it's quicker
nmap <c-f> :CtrlP<cr>
nmap <leader>ff :CtrlP<cr>
nmap <leader>fb :CtrlPBuffer<cr>
nmap <leader>fu :CtrlPMRU<cr>
" ... General vim enhancements

"" Text objects ...
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-indent'
"" ... Text objects

" Ack ...
Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>ack :Ack 
" ... Ack

" Git ...
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
nmap <leader>gs :Gstatus<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gg <leader>ack
nmap <leader>gD :GitGutterLineHighlightsToggle<cr>
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>
let g:gitgutter_sign_column_always = 1
" .. Git

" HTML + Javascript ...
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
autocmd BufRead,BufNewFile *.json   set ft=javascript
" ... HTML + Javascript

" Scala ...
Bundle 'tsaleh/vim-align'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'mattdenner/vim-scala'
autocmd FileType snippets        setlocal noexpandtab
autocmd FileType scala,scalatest setlocal relativenumber
autocmd FileType scala,scalatest setlocal wildignore+=target,*.class  " Ignore sbt generated files
" ... Scala

" Clojure ...
Bundle 'tpope/vim-foreplay'
Bundle 'guns/vim-clojure-static'
" ... Clojure

" General ...
Bundle 'plasticboy/vim-markdown'
Bundle 'juvenn/mustache.vim'
" ... General

"" Rock off vundle ...
filetype plugin indent on

"" Appearance
color lucius                " jellybeans is good too

"" Setup the status line as akitaonrails does...
set laststatus=2
set statusline=%f       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=%{fugitive#statusline()}
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

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

"" Various file type changes
autocmd BufRead,BufNewFile *.scss   set ft=scss
autocmd BufRead,BufNewFile *.txt    set ft=text
autocmd FileType text,markdown,mkd  setlocal wrapmargin=20 | setlocal linebreak | setlocal wrap  " Ensure wrapping happens properly for text & markdown

"" Map some keys
map Y y$

"" Remap window movements to something more akin to tmux, which I've got used to!
nmap <c-W>- :split<cr>
nmap <c-W>\ :vsplit<cr>
nnoremap <c-W>H 5<c-W><
nnoremap <c-W>L 5<c-W>>
nnoremap <c-W>K :resize +5<cr>
nnoremap <c-W>J :resize -5<cr>
" <CTRL>+W H - switch to vertical from horizontal
" <CTRL>+W K - switch to horizontal from vertical
" <CTRL>+W - - reduce window size
" <CTRL>+W + - increase window size

"" Sometimes you need to override this behaviour (like at work for instance!)
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
