" TODO Check is gutentags enough !!!!!
""""""""""" tags """""""""
" let g:filetype_tag_generate_commands = {
"   \ 'ruby': "ripper-tags -R --exclude=vendor",
"   \}

" function! s:err_handler(job_id, data, event_type)
"   let msg = "? An error occurred generating ctags: " . join(a:data)
"   echom msg
"   let g:ctags_in_progress = 0
" endfunction

" function! s:exit_handler(job_id, data, event_type)
"   echom "tags generated"
"   let g:ctags_in_progress = 0
" endfunction

" let g:ctags_in_progress = 0
" fu! RegenerateTags() abort
"   if g:ctags_in_progress || &ft != 'ruby'
"     return
"   endif
"   let g:ctags_in_progress = 1
"   let argv = get(g:filetype_tag_generate_commands, &filetype, 'ctags .')

"   let job_id = jobstart(argv, {
"         \ 'on_stderr': function('s:err_handler'),
"         \ 'on_exit': function('s:exit_handler'),
"         \ })
"   call jobclose(job_id, 'stdin')
" endfu

" autocmd BufWritePost * call RegenerateTags()
""""""""""" tags """""""""


""""""""""" vim-esearch """""""""
let g:esearch = { 'backend': 'nvim', 'adapters': {'rg': {'options': '--hidden'}}}
" call   esearch#map('<C-f><C-f>','esearch')
" call   esearch#map('<C-f>f',    'esearch')
" call   esearch#map('<C-f>w',    'esearch-word-under-cursor')
" call   esearch#map('<C-f><C-w>','esearch-word-under-cursor')

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

highlight link esearchFilename GruvboxGreen
""""""""""" vim-esearch """""""""


""""""""""" SmartGF """""""""
fu! TryCTag() abort
  try
    let cword = expand('<cword>')
    if empty(cword)
      return 0
    endif

    exec "tag " . cword
    return 1
  catch /E73:/ " tag stack is empty
    return 0
  catch /E433:/ " no tags file
    return 0
  catch /E426:/ " no tag  found
    return 0
  endtry
endfu

fu! TryRailsCFile() abort
  if !exists('*rails#cfile')
    return 0
  endif

  try
    exec 'find ' . rails#cfile()
    return 1
  catch /E345:/ " E345: Can't find file in path
    return 0
  catch /Not in a Rails app/
    return 0
  endtry
endfu

fu! TryURI() abort
  " https://github.com/itchyny/vim-highlighturl/blob/master/autoload/highlighturl.vim 
  let pattern = '\v\c%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+\@[a-z]+.[a-z]+:)%('
        \.'%([&:#*@~%_\-=?!+;/.0-9A-Za-z]*%(%([.,][&:#*@~%_\-=?!+;/0-9A-Za-z]+)+|:\d+))?'
        \.'%(\([&:#*@~%_\-=?!+;/.0-9A-Za-z]*\))?%(\[[&:#*@~%_\-=?!+;/.0-9A-Za-z]*\])?'
        \.'%(\{%([&:#*@~%_\-=?!+;/.0-9A-Za-z]*|\{[&:#*@~%_\-=?!+;/.0-9A-Za-z]*\})\})?'
        \.')*[-/0-9A-Za-z]*'

  " This hack is required to capture uri with params after question mark
  """""""""""""""""""""""
  let curcol = col('.')
  let line = getline('.')
  let endpos = 0
  while 1
    " Find next uri start position. Is required to capture file ignoring some
    " chars in ahead like native gf do
    let startpos = match(line, expand("<cfile>"), endpos)
    " Find next uri including uri params end position
    let endpos =  matchend(line, pattern, startpos)
    if endpos ==# -1 | return 0 | endif

    if curcol <= endpos
      let cfile = matchstr(line, pattern, startpos)
      break
    endif
  endwhile
  """""""""""""""""""""""

  call system('open' . ' ' . shellescape(cfile))
  return 1
endfu

fu! TryPlainGF() abort
  try
    norm! gf
    return 1

  catch /E446:/ " No file name under cursor
    return 0
  catch /E447:/ " Can't find file "" in path
    return 0
  endtry
endfu

fu! SmartGF() abort
  for Strategy in g:smartgf_strategies
    if Strategy()
      return
    endif
  endfor
  unsilent echo "Can't find file or tag"
endfu

fu! TryFootnote() abort
  let pattern='\(\[\d\+\]\)'

  let curcol = col('.')
  let line = getline('.')
  let endpos = 0

  let footnote = MatchUnderCursor(pattern)
  if empty(footnote)
    let footnote = matchstr(line, pattern, col('.')-1)
    if empty(footnote) | return 0 | endif
  endif

  " search links section start from the end of an open buffer
  let last_line = line('$')
  let ln = last_line
  while ln > 0
    let line = getline(ln)

    if line ==# '---'
      let ln += 1
      break
    endif
    let ln -= 1
  endwhile

  if ln ==# 0
    return 0
  endif

  let links = []
  let last_line = line('$')
  while ln <= last_line
    call add(links, getline(ln))
    let ln += 1
  endwhile


  let link_pos = ''
  for l in links
    let n = matchstr(l, '^\(\[\d\+\]\)')
    if n ==# footnote
      let link = substitute(l, '^\(\[\d\+\]\) \(.*\)', '\2', '')

      for opener in s:openers
        if executable(opener)
          call system(opener . ' ' . shellescape(link))
          return 1
        endif
      endfor
    endif
  endfor
endfu


function! MatchUnderCursor(pat)
  let line = getline(".")
  let lastend = 0
  while lastend >= 0
    let beg = match(line,'\C'.a:pat,lastend)
    let end = matchend(line,'\C'.a:pat,lastend)
    if beg < col(".") && end >= col(".")
      return matchstr(line,'\C'.a:pat,lastend)
    endif
    let lastend = end
  endwhile
  return ""
endfunction

let g:smartgf_strategies = [function('TryURI'), function('luaeval', ['VimBundlePackage()']),  function('TryPlainGF'), function('TryRailsCFile'), function('TryCTag'), function('TryFootnote')]
""""""""""" SmartGF """""""""
