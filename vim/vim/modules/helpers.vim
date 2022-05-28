fu! s:extend_makers()
  let g:neomake_ruby_mri_maker = neomake#makers#ft#ruby#mri()
  call extend(g:neomake_ruby_mri_maker, {'postprocess': function('PostMake')})
endfu

let g:rails_commands = {
      \ 'h': [ 'Ehelper', 'app/helpers' ],
      \ 'm': {
        \ 'o': [ 'model',      'app/models' ],
        \ 'i': [ 'migration',  'db/migrate' ],
        \ 'a': [ 'mailer',     'app/mailers' ]
        \ },
      \ 'c': [ 'controller',   'app/controllers' ],
      \ 's': [ 'stylesheet',   'app/assets/stylesheets' ],
      \ 'v': [ 'view',         'app/views' ],
      \ 'l': [ 'locale',       'config/locales' ]
      \ }
let g:rails_edit_mappings = {
      \ "\<S-t>": 'T',
      \ "\<S-s>": 'S',
      \ "\<S-e>": 'E',
      \}

let g:rails_edit_default = 'S'

fu! RailsCommands(commands, mappings, runner)
  let commands = a:commands
  let edit_target = ''
  let edit_at = g:rails_edit_default
  while 1
      redraw
      echo (edit_at == g:rails_edit_default ? '('.edit_at.')': edit_at). 'edit >>> ' . edit_target
      let edit_target = nr2char(getchar())

      let mapping = get(a:mappings, edit_target, '') 
      if !empty(mapping)
        if edit_at == mapping
          let g:rails_edit_default = mapping
        else
          let edit_at = mapping
        endif
        continue
      endif

      let a = get(commands, edit_target)
      if type(a) == type([])
        let rails_command = a[0]
        let target_path = get(a, 1, '')
        break
      elseif type(a) == type({})
        let commands = a
        unlet a
      elseif edit_target == "\<C-c>" || edit_target == "\<Esc>"
        redraw
        echo 'Cancelled'
        return -1
      else
        redraw
        echohl ErrorMsg | echo 'No such handler =(' | echohl None
        return -1
      endif
  endwhile

  let rails_command = toupper(edit_at) . rails_command
  try
    exe rails_command
  catch
    if target_path == ''
      call feedkeys(':' . rails_command . "\<space>", 'n')
    else
      exe printf(a:runner, target_path)
    endif
  endtry
endfu

fu! Cleanup()
  retab
  while 1
    redraw
    let choice = nr2char(getchar())
    if tolower(choice) == 'q'
      break
    elseif choice == 'r'
      %s/\n\{3,}/\r\r/e
      echo 'Remove repeated lines'
    elseif choice == 'e'
      %s/\s\+$//e
      echo 'Remove empty lines'
    elseif choice == 'c'
      g/\v^\s*#/d
      echo 'Remove comments'
    endif
  endwhile
endfu

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

" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction

if has('nvim')
  fu! CheckSyntax()
    " exe 'Neomake'
    " if exists('w:s_err_count')
    "   unlet w:s_err_count
    " endif
    " if exists('w:s_err_count')
    "   unlet w:s_warn_count
    " endif
  endfu
  fu! PostMake(...)
    " let w:s_err_count  = l:loclist.E
    " let w:s_warn_count = l:loclist.W
    let w:s_err_count  = get(l:loclist, 'E', 0)
    let w:s_warn_count = get(l:loclist, 'W', 0)
    call lightline#update()
  endfu
  " call s:extend_makers()
else
  fu! CheckSyntax()
    if !exists(':SyntasticCheck')
      return
    endif
    exe 'SyntasticCheck'
    let loclist = g:SyntasticLoclist.current()
    let w:s_errors     = loclist.errors()
    let w:s_warnings   = loclist.warnings()
    let w:s_err_count  = len(w:s_errors)
    let w:s_warn_count = len(w:s_warnings)
  endfu
endif

fu! RmSwp()
  let swp_path = &directory . substitute(expand('%:p'), '\/', '%', 'g') . '.swp'
  if filereadable(swp_path)
    let rm_cmd = 'rm '.shellescape(swp_path)
    call system(rm_cmd)
    echo rm_cmd
  else
    echo '.swp file not found'
  endif
endfu

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

fu! RemoveFugitiveIndexFiles(l1, l2)
  for l in range(a:l1, a:l2)
    let filename = matchstr(getline(l),'^#\t\zs.\+\ze$')
    " let filename = matchstr(getline(l),'^#\t\zs.\{-\}\ze\%( ([^()[:digit:]]\+)\)\=$')
    if empty(filename) | continue | endif

    let choice = input('Remove file "' . filename . '"? (y/N) ')
    if choice[0] == 'y'
      call delete(filename)
      edit
    end
  endfor
  return 'redraw!'
endfu

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

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction



function! g:BMWorkDirFileLocation()
    let filename = 'bookmarks'
    let location = ''
    if isdirectory('.git')
        " Current work dir is git's work tree
        let location = getcwd().'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', '.;')
    endif
    if len(location) > 0
        return location.'/'.filename
    else
        return getcwd().'/.'.filename
    endif
endfunction


let g:python_bp_line="__import__('ipdb').set_trace()"
let g:ruby_bp_line="require 'pry'; binding.pry"
let g:eruby_bp_line="<% require 'pry'; binding.pry %>"
let g:js_bp_line="debugger // eslint-disable-line"

func! BpString()
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
    exe 'silent! g/'.BpString().'/d'
endf

fun! ToggleBreakpoint(lnum)
    let line = getline(a:lnum)
    let pb_string = BpString()
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
