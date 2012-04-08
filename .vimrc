syntax on
filetype plugin indent on

set nocompatible
set autoindent
set autowrite

" set list
set number
set wildmenu
set wildchar=<TAB>
set backspace="indent,eol,start"
set showmatch 
set incsearch

" no back up files
set nobackup
set nowritebackup
" no swap file
set directory=

" manange plugins by vundle
set rtp+=~/.vim/vundle
call vundle#rc()

let g:neocomplcache_enable_at_startup = 1

" Bundle 'project.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'akiradeveloper/project.vim'
