set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

let g:neobundle_default_git_protocol = 'http'
 
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-jp/vital.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'

" ### Haskell plugins ###
" completefunc is set by haskell_doc.vim.  I don't like it. 
" NeoBundle 'http://github.com/lukerandall/haskellmode-vim'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pbrisbin/html-template-syntax'
" NeoBundle 'kana/vim-textobj-indent' 

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

function g:set_local_indent_level(level)
  execute "setlocal expandtab"
  execute "setlocal shiftwidth=" . a:level
  execute "setlocal tabstop=" . a:level
  execute "setlocal softtabstop=" . a:level
endfunction

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
