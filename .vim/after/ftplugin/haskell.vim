call g:set_local_indent_level(2)

" necoghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" haskellmode-vim
" au BufEnter *.hs compiler ghc
