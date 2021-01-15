"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

set nocompatible
set nocp
set backspace=2
"set nobackup
"set nowritebackup
"set noswapfile
set history=5000
set ruler
set number
set showcmd
set incsearch
set laststatus=2
set autowrite
set modelines=0
set nomodeline
set vb noerrorbells


"execute pathogen#infect()

colo default
set background=dark
syntax on
syntax enable
filetype plugin on
autocmd BufRead *.py set smartindent ft=python cinwords=if,elif,else,for,while,try,except,finally,def,class
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

"Function to strip trailing white space
fun! TrimWhitespace()
   :echo "TrimWhitespace was called!"
   let l:save = winsaveview()
   keeppatterns %s/\s\+$//e
   call winrestview(l:save)
endfun
command! TS call TrimWhitespace()

"Filetypes where I want special sauce on the side.
"Python
"autocmd BufNewFile,BufRead *.py set ft=python
"autocmd BufWritePost *.py call Flake8()
"YAML
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> autoindent  foldmethod=indent nofoldenable
autocmd BufWritePre *.yml normal :call TS

"autocmd BufWritePre *.yml normal %s/\s\+$//e
"autocmd FileType yaml BufWritePre <buffer> :%/\s\+$//e

"=====[ Comments are important ]==================

highlight Comment term=bold cterm=italic ctermfg=white gui=italic guifg=white


