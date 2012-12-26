""" vim2hs
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_conceal_wide = 1
let g:haskell_jmacro = 0
" These are enabled by default.
" let g:haskell_quasi = 0
" let g:haskell_regex = 0
" let g:haskell_jmacro = 0
" let g:haskell_shqq = 0
" let g:haskell_sql = 0
" let g:haskell_json = 0
" let g:haskell_xml = 0
"
" let g:haskell_hsp = 0
" let g:haskell_tabular = 0

""" necoghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""" syntastic
call add(g:syntastic_mode_map['passive_filetypes'], 'haskell')
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

""" haskellmode-vim
" au BufEnter *.hs compiler ghc
"

""" test
" echom vimproc#get_command_name("ls")
