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
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}   set ft=ruby
au BufNewFile,BufRead *.json                                              set ft=javascript
