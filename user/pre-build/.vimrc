set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vimbundle/neobundle.vim/
  call neobundle#rc(expand('~/.vimbundle/'))
endif

let g:neobundle_default_git_protocol = 'http'

" NeoBundle 'akiradeveloper/dummy-vim-plugin'

NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/textobj-user'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kana/vim-textobj-indent' 
" NeoBundle 'yuratomo/w3m.vim'

""" Haskell
" NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'pbrisbin/html-template-syntax'

""" Ruby
NeoBundle 'vim-ruby/vim-ruby'

""" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

""" VimFiler
" open VimFiler instead of netrw which launches by typing :e . .
let g:vimfiler_as_default_explorer = 1
nnoremap <Space>f :call <SID>toggle_vimfiler()<Cr>
function! s:toggle_vimfiler()
  VimFiler -simple -buffer-name=explorer -split -winwidth=35 -toggle -no-quit<Cr>
endfunction 
autocmd VimEnter * call <SID>toggle_vimfiler()
autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif

""" unite-haddock
let g:unite_source_hoogle_max_candidates = 200
" w3m doesn't work.
" let g:unite_source_haddock_browser = 'w3m'
" firefox requires GUI.
" let g:unite_source_haddock_browser = 'firefox'
" let g:w3m#command = 'w3m'

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

" Make vim quiet.
set noerrorbells
set vb t_vb=

filetype plugin indent on

" Utilities
function g:set_local_indent_level(level)
  execute "setlocal expandtab"
  execute "setlocal shiftwidth=" . a:level
  execute "setlocal tabstop=" . a:level
  execute "setlocal softtabstop=" . a:level
endfunction
