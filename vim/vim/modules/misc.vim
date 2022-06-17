fu! TrimWhiteSpace()
  %s/\s\+$//e
  %s/\n\{3,}/\r\r/e
  retab
endf

" old tags
fu! GenerateCtags()
  if !RailsDetect()
    return ''
  endif

  call system("mkdir -p tmp")

  let path = 'tmp/tags'
  let tpath = filereadable(path) == 0 ? '-f ' . path : '-a ' . path

  call system('ripper-tags -R --tag-relative=yes  --append=yes --exclude=.git --exclude=log '.tpath .' *')
endfu
" au BufWritePost * if &ft ==# 'ruby' | call GenerateCtags() |endif

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

function! IndentWithI()
  if getline('.') =~ '^\s*$'
    return '"_cc'
  else
    return "i"
  endif
endfunction
" nnoremap <expr> i IndentWithI()

" tags
let g:filetype_tag_generate_commands = {
  \ 'ruby': "ripper-tags -R --exclude=vendor",
  \}

function! s:err_handler(job_id, data, event_type)
  let msg = "? An error occurred generating ctags: " . join(a:data)
  echom msg
  let g:ctags_in_progress = 0
endfunction

function! s:exit_handler(job_id, data, event_type)
  echom "tags generated"
  let g:ctags_in_progress = 0
endfunction

let g:ctags_in_progress = 0
fu! RegenerateTags() abort
  if g:ctags_in_progress || &ft != 'ruby'
    return
  endif
  let g:ctags_in_progress = 1
  let argv = get(g:filetype_tag_generate_commands, &filetype, 'ctags .')

  let job_id = jobstart(argv, {
        \ 'on_stderr': function('s:err_handler'),
        \ 'on_exit': function('s:exit_handler'),
        \ })
  call jobclose(job_id, 'stdin')
endfu

autocmd BufWritePost * call RegenerateTags()

" esearch
let g:esearch = { 'backend': 'nvim', 'adapters': {'rg': {'options': '--hidden'}}}
call   esearch#map('<C-f><C-f>','esearch')
call   esearch#map('<C-f>f',    'esearch')
call   esearch#map('<C-f>w',    'esearch-word-under-cursor')
call   esearch#map('<C-f><C-w>','esearch-word-under-cursor')

"   Keymap |     What it does
" ---------+---------------------------------------------------------------------------------------------
"    yf    | Yank a hovered file absolute path.
"    t     | Use a custom command to open the file in a tab.
"    +     | Render [count] more lines after a line with matches. Ex: + adds 1 line, 10+ adds 10.
"    -     | Render [count] less lines after a line with matches. Ex: - hides 1 line, 10- hides 10.
"    gq    | Populate QuickFix list using results of the current pattern search.
"    gsp   | Sort the results by path. NOTE that it's search util-specific.
"    gsd   | Sort the results by modification date. NOTE that it's search util-specific.

" Each definition contains nvim_set_keymap() args: [{modes}, {lhs}, {rhs}].
let g:esearch.win_map = [
 \ ['n', 'yf',  ':call setreg(esearch#util#clipboard_reg(), b:esearch.filename())<cr>'],
 \ ['n', 't',   ':call b:esearch.open("NewTabdrop")<cr>'                              ],
 \ ['n', '+',   ':call esearch#init(extend(b:esearch, EsearchAddAfter(+v:count1)))<cr>'      ],
 \ ['n', '-',   ':call esearch#init(extend(b:esearch, EsearchAddAfter(-v:count1)))<cr>'      ],
 \ ['n', 'gq',  ':call esearch#init(extend(copy(b:esearch), {"out": "qflist"}))<cr>'  ],
 \ ['n', 'gsp', ':call esearch#init(extend(b:esearch, esearch_sort_by_path))<cr>'             ],
 \ ['n', 'gsd', ':call esearch#init(extend(b:esearch, esearch_sort_by_date))<cr>'             ],
 \]

" Helpers to use in keymaps.
let g:esearch_sort_by_path = {'adapters': {'rg': {'options': '--sort path'}}}
let g:esearch_sort_by_date = {'adapters': {'rg': {'options': '--sort modified'}}}
let g:EsearchAddAfter = {n -> {'after': b:esearch.after + n, 'backend': 'system'}}
