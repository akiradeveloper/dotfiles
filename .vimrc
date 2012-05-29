set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'thinca/vim-localrc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'L9'
NeoBundle 'ujihisa/vital.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

" VimFiler
" open VimFiler instead of netrw which launches by typing :e . .
let g:vimfiler_as_default_explorer = 1
nnoremap <Space>f :call <SID>toggle_vimfiler()<Cr>
function! s:toggle_vimfiler()
  VimFiler -simple -buffer-name=explorer -split -winwidth=35 -toggle -no-quit<Cr>
endfunction 
autocmd VimEnter * call <SID>toggle_vimfiler()
autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif

let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
\ 'command' : 'bluecloth',
\ 'exec' : '%c -f %s'
\ }

syntax on
set autoindent
set autowrite
set number
set wildmenu
set wildchar=<TAB>
set backspace="indent,eol,start"
set showmatch 
set incsearch
set nobackup
set nowritebackup
"set backupdir=$HOME/backup
"set directory=
"set encoding=utf-8
"set list

filetype plugin indent on
