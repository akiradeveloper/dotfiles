set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vimbundle/neobundle.vim/
  call neobundle#rc(expand('~/.vimbundle/'))
endif

let g:neobundle_default_git_protocol = 'http'

" NeoBundle 'akiradeveloper/dummy-vim-plugin'

" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'akiradeveloper/desert.vim'
" NeoBundle 'tomasr/molokai'

" not found
" NeoBundle 'marks_corey' 
" NeoBundle 'matchit'

" NeoBundle 'vim-scripts/ManPageView'

NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'vim-scripts/autodate.vim'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/textobj-user'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent' 
NeoBundle 'kana/vim-textobj-fold' 
NeoBundle 'kana/vim-textobj-lastpat' 
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tomtom/tcomment_vim'

" bad behavior
" NeoBundle 'nathanaelkane/vim-indent-guides'

" basic w3m suffices.
" NeoBundle 'yuratomo/w3m.vim'

""" Haskell
" heavy and maybe meaningless
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

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

syntax enable
syntax on

" set background=dark
" let g:solarized_termcolors = 256
" let g:solarized_contrast = 'high'
" let g:solarized_visibility = 'high'
" let g:solarized_bold = 1
" let g:solarized_termtrans = 1
" colorscheme solarized

" colorscheme molokai
" let g:molokai_original = 1

" set background=light
" colorscheme desert

vnoremap < <gv
vnoremap > >gv

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

set foldmethod=syntax

augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set clipboard+=unnamed

filetype plugin indent on

" Utilities
function! g:set_local_indent_level(level)
  execute "setlocal expandtab"
  execute "setlocal shiftwidth=" . a:level
  execute "setlocal tabstop=" . a:level
  execute "setlocal softtabstop=" . a:level
endfunction
