set nocompatible
set nocp
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set number
set showcmd
set incsearch
set laststatus=2
set autowrite
set modelines=0
set nomodeline
set vb noerrorbells

call pathogen#infect()
"syntax on
syntax enable
filetype plugin on
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
filetype plugin indent on

"set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

autocmd BufNewFile,BufRead *.py set ft=python
autocmd BufWritePost *.py call Flake8()

