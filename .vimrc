set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'L9'
NeoBundle 'ujihisa/vital.vim'

NeoBundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

NeoBundle 'Shougo/vimfiler'
" open VimFiler instead of netrw which launches by typing :e . .
let g:vimfiler_as_default_explorer = 1
nnoremap <Space>f :call <SID>toggle_vimfiler()<Cr>
function! s:toggle_vimfiler()
  VimFiler -simple -buffer-name=explorer -split -winwidth=35 -toggle -no-quit<Cr>
endfunction 
autocmd vimenter * call <SID>toggle_vimfiler()
"nnoremap <C-o> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
"autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! g:my_vimfiler_settings()
"  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map(\<Plug>(vimfiler_expand_tree), \<Plug>(vimfiler_edit_file))
"  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
"  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
"endfunction
"
"let my_action = { 'is_selectable' : 1 }
"function! my_action.func(candidates)
"  wincmd p
"  exec 'split '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_split', my_action)
"
"let my_action = { 'is_selectable' : 1 }                     
"function! my_action.func(candidates)
"  wincmd p
"  exec 'vsplit '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_vsplit', my_action)

NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'FuzzyFinder'

"NeoBundle 'QuickBuf'
"NeoBundle 'scrooloose/nerdtree'
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"let g:NERDTreeShowHidden=1

"NeoBundle 'gmarik/vundle'
"set runtimepath+=~/.vim/bundle/vundle/
"call vundle#rc()

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
