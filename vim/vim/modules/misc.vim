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

xnoremap p pgvy
let g:pasta_paste_after_mapping = ',p'

fu! TogglePasterMode()
  if &paste | set nopaste | else | set paste | endif | echo ''
endf

fu! ToggleMouseMode()
  if &mouse == 'a' | set mouse= | echo '' | else | set mouse=a | echo 'Mouse enabled' | endif
endf

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
