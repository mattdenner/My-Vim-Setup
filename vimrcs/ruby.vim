" Configuration for ruby
Bundle 'nelstrom/vim-textobj-rubyblock'
autocmd BufRead,BufNewFile {Capfile,Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.thor} set ft=ruby

" Setup some custom project types
let g:projectTypeChecks['Rakefile'] = 'ruby'
