set nocompatible                " choose no compatibility with legacy vi
set number
set ruler
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set autoread                    " reload files that have change on disk but not in buffer

"" Appearance
color lucius                " jellybeans is good too
set foldmethod=syntax       " Syntax folding
set foldlevelstart=4        " Any folds deeper than this will be closed

"" Enable pathogen so that we can put plugins under '.vim/bundle'
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on       " load file type plugins + indentation
runtime macros/matchit.vim      " Enable the matchit plugin

"let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'vim-textobj-user')
"call add(g:pathogen_disabled, 'vim-textobj-rubyblock')

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
command CTags :!ctags -R

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class " Ignore compiled files
set wildignore+=vendor/gems/*i          " Ignore Rails gems
set wildignore+=.git,.git/*,.svn,.svn/* " Ignore SCM related files
set wildignore+=*.png,*.gif             " Ignore images files

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
nmap <c-f> :CtrlP<cr>

"" Clojure support
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

"" Various file type changes
autocmd BufRead,BufNewFile {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.thor} set ft=ruby
autocmd BufRead,BufNewFile *.json                                                      set ft=javascript
autocmd BufRead,BufNewFile *.scss                                                      set ft=scss

autocmd BufRead,BufNewFile *.txt                                               set ft=text
autocmd FileType text,markdown,mkd  setlocal wrapmargin=20 | setlocal linebreak | setlocal wrap  " Ensure wrapping happens properly for text & markdown

autocmd FileType ruby setlocal relativenumber  " Relative line numbering

"" A whole heap of stuff I really can't ever remember but just want to note or
"" may turn into something useful!
"
" qqF[cs])f(cs)]df]F(Pq => a macro for swapping markdown links which I *always* get the wrong way round!

" A quick way to open the vim help in a vertical buffer
command -nargs=? Vhelp vert botright help <args>

"" Enable per-directory vimrc files but ensure they can't do anything nasty!
set exrc
set secure

"" Map some keys
map Y y$
