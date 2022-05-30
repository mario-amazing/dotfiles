fu! TrimWhiteSpace()
  %s/\s\+$//e
  %s/\n\{3,}/\r\r/e
  retab
endf

fu! Quit()
  try
    silent q
  catch /^Vim(quit):/
    echohl ErrorMsg | echo 'Save changes before closing?(Y/n)' | echohl None
    let choice = tolower(nr2char(getchar()))
    redraw
    if choice == 'y' || choice == "\<CR>"
      wq
    elseif choice == 'n' || choice == "\<S-q>"
      q!
    else
      echo 'Cancelled'
    endif
  endtry
endfu

inoremap <silent> <Bar>   <Bar><Esc>:call GAalign()<CR>a
function! GAalign()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


fu! GenerateCtags()
  return ''
  let p = 'tmp/tags'

  if !RailsDetect()
    return ''
  endif
  if RailsDetect()
    if !isdirectory(fnamemodify(p, ':h'))
      call mkdir('tmp')
    endif
  endif
  let tpath = fnameescape(p)
  let tpath =  filereadable(p) ? '-f ' . tpath : '-a ' . tpath
  " exe 'silent Dispatch! ctags -R --tag-relative=yes --languages=Ruby --append=yes --exclude=.git --exclude=log '.tpath .' *'
  exe 'silent Dispatch! ripper-tags -R --tag-relative=yes  --append=yes --exclude=.git --exclude=log '.tpath .' *'
endfu
au BufWritePost * if &ft ==# 'ruby' | call GenerateCtags() |endif


fu! Exists(files)
  let r = []
  for f in a:files
    if filereadable(f)
      call add(r, f)
    endif
  endfor
  return r
endfu


fu! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

fu! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc


let g:python_bp_line="__import__('ipdb').set_trace()"
let g:ruby_bp_line="require 'pry'; binding.pry"
let g:eruby_bp_line="<% require 'pry'; binding.pry %>"
let g:js_bp_line="debugger // eslint-disable-line"

func! BreakPointString()
    if &filetype == "ruby"
      return g:ruby_bp_line
    elseif &filetype == "eruby" || &filetype == "eruby.html"
      return g:eruby_bp_line
    elseif &filetype == "javascript" || &filetype == "typescript" || &filetype == "typescriptreact"
      return g:js_bp_line
    elseif &filetype == "python"
      return g:python_bp_line
    endif
endfunc

func! RemoveBreakpoints()
    exe 'silent! g/'.BreakPointString().'/d'
endf

fun! ToggleBreakpoint(lnum)
    let line = getline(a:lnum)
    let pb_string = BreakPointString()
    if strridx(line, pb_string) != -1
        normal dd
    else
        let plnum = prevnonblank(a:lnum)
        if &expandtab
            let indents = repeat(' ', indent(plnum))
        else
            let indents = repeat("\t", plnum / &shiftwidth)
        endif

        call append(line('.')-1, indents.pb_string)
        normal k
    endif
endf
