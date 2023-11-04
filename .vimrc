"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
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
set relativenumber
set showcmd
set incsearch
set laststatus=2
set autowrite
set modelines=0
set nomodeline
set vb noerrorbells

call plug#begin()
" Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-unimpaired'
Plug 'preservim/nerdtree'
Plug 'bling/vim-bufferline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'ap/vim-css-color'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
<<<<<<< HEAD
" Plug 'jiangmiao/auto-pairs'
=======
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'mbbill/undotree'
>>>>>>> 759bbae (Set mouse to auto in .vimrc)
call plug#end()

" Plug 'ap/vim-css-color'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"execute pathogen#infect()

"colo default
" colo desert
set background=dark
syntax on
syntax enable
filetype plugin on
" autocmd BufRead *.py set smartindent ft=python cinwords=if,elif,else,for,while,try,except,finally,def,class
" autocmd BufRead *.py set nocindent
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" filetype plugin indent on

"set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set mouse=a

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
" au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
" autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=0# indentkeys-=<:> autoindent  foldmethod=indent nofoldenable
" autocmd BufWritePre *.yml normal :call TS

"autocmd BufWritePre *.yml normal %s/\s\+$//e
"autocmd FileType yaml BufWritePre <buffer> :%/\s\+$//e
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"=====[ Comments are important ]==================

" highlight Comment term=bold cterm=italic ctermfg=green gui=italic guifg=green

" let g:coc_disable_startup_warning = 1

