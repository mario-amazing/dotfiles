fu! ExitFugitive(cmd) abort
  try
    if !exists(':Gedit') | exe 'silent ' . a:cmd | return | endif
    if (&diff == 0 || getbufvar('#', '&diff') == 0) " && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
        exe a:cmd
    else
        exe a:cmd
        Gedit :
    endif
  catch
    echohl ErrorMsg | echo v:exception | echohl None
  endtry
endfu

" Not override clipboard on paste ( currently overrides with vim-pasta)
" xnoremap p pgvy

set previewheight=50
au BufEnter ?* call PreviewHeightWorkAround()
fu! PreviewHeightWorkAround()
  if &previewwindow
    exec 'setlocal winheight='.&previewheight
  endif
endfunc

fu! HighlightColLimit(collumnLimit, matchName)
  let pattern = '\%<' . (a:collumnLimit+1) . 'v.\%>' . a:collumnLimit . 'v'
  let w:colLimHl = matchadd(a:matchName, pattern, -1)
endf

function! IndentWithI()
  if getline('.') =~ '^\s*$'
    " return "\"_cc"
    return '"_cc'
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()
