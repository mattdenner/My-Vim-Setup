set nocompatible                " choose no compatibility with legacy vi
set number
set ruler
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Enable pathogen so that we can put plugins under '.vim/bundle'
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on       " load file type plugins + indentation
runtime macros/matchit.vim      " Enable the matchit plugin

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
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"" Various file type changes
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}   set ft=ruby
autocmd BufRead,BufNewFile *.json                                              set ft=javascript
autocmd BufRead,BufNewFile *.scss                                              set ft=scss

autocmd BufRead,BufNewFile *.txt                                               set ft=text
autocmd FileType text,markdown  set wrapmargin=20 | set linebreak | set wrap  " Ensure wrapping happens properly for text & markdown
