fu! CustomFoldText()
  let fs = v:foldstart "get first non-blank line
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1) | endwhile
  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat("-", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

" If only NERDTRree window left keep them except there was an empty buffer
let g:deleted_buffer = -1
fu! KeepTree()
  if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")
    if g:deleted_buffer == ''
      q
    else
      new
      NERDTreeClose
      NERDTreeTabsToggle
      " NERDTreeToggle
    endif
  endif
  let g:deleted_buffer = -1
endfu

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

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()

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

fu! g:FoldEverything()
  if &foldmethod == "indent" | setl foldlevel=1 | else | setl foldlevel=0 | endif
endfu

fu! ToggleFoldColumn()
  if &foldcolumn == 0
    let max = max(map(range(1, line('$')), 'foldlevel(v:val)'))
    let &foldcolumn = max == 0 ? 0 : 1 + max
    setlocal numberwidth=1
  else
    let &foldcolumn = 0
    setlocal numberwidth=2
  endif
endfu

fu! GdiffInTab()
  if &modifiable && bufname('%') != ''
    exe 'tabedit %'
    exe 'Gdiff'
  else
    echohl ErrorMsg | echo "Can't run gdiff on the curr buffer" | echohl None
  endif
endfu

fu! RunFugitiveInNewWindow(cmd)
  if g:NERDTree.GetWinNum() != -1 | NERDTreeClose | let restore_tree = 1 | else | let restore_tree = 0 | endif
  Explore .
  let tmpBuf = bufnr('%')
  if restore_tree | NERDTreeFocus | wincmd p | endif
  exe a:cmd
  if bufexists(tmpBuf) && bufnr('%') != tmpBuf | exe 'bw '.tmpBuf | endif
endfu

fu! RunFugitiveInNewTab(cmd)
  Texplore .
  let tmpBuf = bufnr('%')
  exe a:cmd
  if bufexists(tmpBuf) && bufnr('%') != tmpBuf | exe 'bw '.tmpBuf | endif
endfu
command! -nargs=* -complete=command Exe call RunFugitiveInNewWindow(<f-args>)
command! -nargs=* -complete=command TExe call RunFugitiveInNewTab(<f-args>)

fu! HighlightColLimit(collumnLimit, matchName)
  let pattern = '\%<' . (a:collumnLimit+1) . 'v.\%>' . a:collumnLimit . 'v'
  let w:colLimHl = matchadd(a:matchName, pattern, -1)
endf

fu! OpenMyVimrc()
  if &mod == 1 | exec('split '. $MYVIMRC) | else | exec('edit '. $MYVIMRC) | endif
endf

function! FullBuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    "if buflisted(b)
      call add(res, bufname(b))
    "endif
  endfor
  return res
endfunction

function! IndentWithI()
  if getline('.') =~ '^\s*$'
    " return "\"_cc"
    return "cc"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

function! CloseSomething()
  if tabpagenr("$") > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr("$")
    tabclose | tabprev
  else
    q
  endif
endfunction
