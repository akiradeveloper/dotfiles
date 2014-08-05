" Last Change: 25-Jan-2014.

"""""""""""
" NeoBundle
"""""""""""
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vimbundle/neobundle.vim/
  call neobundle#rc(expand('~/.vimbundle/'))
endif

" 'https' is chosen instead of 'http'
" because 'git clone' with http protocol 
" sometimes raises error.
" result=22 http_code=413 is what I have seen before.
" https is considered to be as often permitted as http.
let g:neobundle_default_git_protocol = 'https'
NeoBundle 'Shougo/neobundle.vim'

" Use :NeoBundleLazy if you want to load a plugin with specified filetype




" NeoBundle 'vim-scripts/ManPageView'
NeoBundle 'vim-scripts/SudoEdit.vim'
NeoBundle 'vim-scripts/L9'
" NeoBundle 'vim-scripts/textobj-user'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun' " \ + r to run the script
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-visualstar' " moving to the next keyword you are on now
" NeoBundle 'thinca/vim-ref' " read reference in vim
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'kana/vim-smartchr' " puts different string according to # key down
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent' 
NeoBundle 'kana/vim-textobj-fold' 
NeoBundle 'kana/vim-textobj-lastpat' 
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'

NeoBundle 'tomtom/tcomment_vim' " Toggles comments
NeoBundle 'vim-scripts/matchit.zip' " moving from { to } by a typing %
" NeoBundle 'scrooloose/syntastic' " syntax check
" NeoBundle 'yuratomo/w3m.vim' " enough with w3m or lynx
"
NeoBundle 'majutsushi/tagbar'

""""""""""""""
" For Markdown
""""""""""""""
NeoBundle 'tpope/vim-markdown'


"""""""""""""
" For Haskell
"""""""""""""
" NeoBundle 'lukerandall/haskellmode-vim' " Too heavy and out
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim' " cabal install ghc-mod is required.
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'pbrisbin/html-template-syntax'


""""""""""
" For Ruby
""""""""""
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'fatih/vim-go'


"""""""""""
" For Scala
"""""""""""
NeoBundle 'derekwyatt/vim-scala'


"""""""""""
" For OCaml
"""""""""""
" [error] omlet not found
" NeoBundle 'vim-scripts/omlet.vim'

" [error] ocamlspot not found
" NeoBundle "cohama/the-ocamlspot.vim"

NeoBundle "elixir-lang/vim-elixir"

"""""""""""""""
" Neocomplcache
"""""""""""""""
NeoBundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

NeoBundle 'Shougo/vimfiler'
" open VimFiler instead of netrw which launches by typing :e . .
let g:vimfiler_as_default_explorer = 1
nnoremap <Space>f :call <SID>toggle_vimfiler()<Cr>
function! s:toggle_vimfiler()
  echomsg("launches vimfiler")
  VimFiler -simple -buffer-name=explorer -split -winwidth=35 -toggle -no-quit
  " VimFilerExplorer<Cr> 
endfunction 
autocmd VimEnter * call <SID>toggle_vimfiler()
autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif


"""""""""""""
" Easy Motion
"""""""""""""
" FIXME
" with Easy Motion on the CPU usage goes too high
" what is the problem?
" sneaking around the code with string searching is enough fast
" we don't need this. then turned off.

" NeoBundle 'Lokaltog/vim-easymotion' " Jumping around the code by key
" let g:EasyMotion_leader_key = ";"
" let g:EasyMotion_keys = "j"
" " let g:EasyMotion_grouping = 1
" hi EasyMotionTarget ctermbg=none ctermfg=red
" hi EasyMotionTarget ctermbg=none ctermfg=blue


""""""""""
" Autodate
""""""""""
" usage:
" :Autodate
" :Autodate(ON|OFF)
NeoBundle 'vim-scripts/autodate.vim'
let plugin_autodate_disable = 1


"""""""""""""""
" unite-haddock
"""""""""""""""
let g:unite_source_hoogle_max_candidates = 200
" w3m doesn't work.
" let g:unite_source_haddock_browser = 'w3m'
" firefox requires GUI.
" let g:unite_source_haddock_browser = 'firefox'
" let g:w3m#command = 'w3m'


" visually displays indent levels
" NeoBundle 'nathanaelkane/vim-indent-guides' " behaves badly
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 30
" let g:indent_guides_guide_size = 1

syntax enable
syntax on

""""""""""""""
" Color Scheme
""""""""""""""

" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'marks_corey' 
" NeoBundle 'matchit'

" set background=dark
" let g:solarized_termcolors = 256
" let g:solarized_contrast = 'high'
" let g:solarized_visibility = 'high'
" let g:solarized_bold = 1
" let g:solarized_termtrans = 1
" colorscheme solarized

" colorscheme molokai
" NeoBundle 'tomasr/molokai'
" let g:molokai_original = 1

" set background=light
" NeoBundle 'akiradeveloper/desert.vim'
" colorscheme desert


" change the indent of multiple lines
" designated by visual mode
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
set noswapfile
set clipboard+=unnamed
"set backupdir=$HOME/backup
"set directory=
"set encoding=utf-8
"set list

" make vim quiet.
set noerrorbells
set vb t_vb=

set foldmethod=syntax
set nofoldenable

augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

" move the cursor where it was on editor closed
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

filetype plugin indent on
