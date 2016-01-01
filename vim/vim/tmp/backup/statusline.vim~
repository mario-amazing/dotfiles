fu s:SID()
  return matchstr(expand('<sfile>'), '\zs<SNR>\d\+_\zeSID$')
endfun
set laststatus=2
set noshowmode
let g:Powerline_symbols = 'fancy'
if has('nvim')
  fu! s:read_gemhome(_, data)
    let $GEM_HOME = a:data[0]
  endfu
  let $GEM_HOME = ''
  call jobstart('env -i PATH="'.$PATH.'" ruby -rubygems -e "print Gem.dir"', {'on_stdout': function('s:read_gemhome')})
else
  let $GEM_HOME = system('env -i PATH="'.$PATH.'" ruby -rubygems -e "print Gem.dir"')
endif
let s:SID = s:SID()

" let s:p =  g:lightline#colorscheme#spacegray#palette
let s:rbicon   = [['', '', 203]]
let s:erricon  = [['', '', 1  ]]
let s:warnicon = [['', '', 3  ]]
" let s:middle   = get(s:p.normal, 'middle', [['', '', 248, 8]])

" exe 'hi RbIconM   ctermfg='.get(s:p.normal, 'rbicon'  , s:rbicon  )[0][2].' ctermbg='.s:middle[0][3]
" exe 'hi ErrIconM  ctermfg='.get(s:p.normal, 'erricon' , s:erricon )[0][2].' ctermbg='.s:middle[0][3]
" exe 'hi WarnIconM ctermfg='.get(s:p.normal, 'warnicon', s:warnicon)[0][2].' ctermbg='.s:middle[0][3]
" exe 'hi StatLnM   ctermfg='.s:middle[0][2]                               .' ctermbg='.s:middle[0][3]

" \ 'fname':    '%-010.20t'
let g:lightline = {
      \ 'colorscheme': 'spacegray',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'filename', 'modified'], [ 'search_stat' ]],
      \   'right': [['percent', 'lineinfo'], [ 'relpath', 'filetype', 'fticon'], 
                  \ ['first_err', 'err', 'warn', 'git', 'rbver']]
      \ },
      \ 'inactive': {
      \   'left': [[], [ 'lpadding', 'filename', 'modified'], []],
      \   'right': [[], ['relpath', 'filetype', 'padding']]
      \ },
      \ 'tabline': {
      \   'left':  [[ 'tabs' ]],
      \   'right': [[]]
      \ },
      \ 'tab': {
      \   'active':   [ 'tabnum', 'fticon', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'component': {
      \ 'padding': '%{"             "}',
      \ 'lpadding': '%{" "}',
      \ 'fname':    '%t'
      \ },
      \ 'component_function': {
      \   'filetype':     s:SID."filetype",
      \   'relpath':      s:SID."relpath",
      \   'abspath':      s:SID."abspath",
      \   'rvm':          s:SID.'rvmrbver',
      \   'filename':     s:SID.'fname',
      \   'mode':         s:SID.'mode',
      \   'search_stat':  s:SID.'search_stat',
      \   'modified':     s:SID.'modified',
      \ },
      \ 'tab_component_function': {
      \   'fticon': s:SID.'fticon'
      \ },
      \ 'component_expand': {
      \   'percent':    s:SID.'percent',
      \   'lineinfo':   s:SID.'lineinfo',
      \   'first_err':  s:SID.'first_err',
      \   'warn':       s:SID.'warn',
      \   'err':        s:SID.'err',
      \   'rbver':        s:SID.'rbver',
      \   'git':        s:SID.'git',
      \ },
      \ 'component_type': {
      \ },
      \ 'separator':            { 'left': '', 'right': '' },
      \ 'subseparator':         { 'left': '', 'right': '' },
      \ 'tabline_separator':    { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '', 'right': '' },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   'c' : 'C',
      \   "\<C-v>": 'VB',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   '?': ' ',
      \ }
      \ }
" ⋮
"
fu! s:git()
  if s:regularbuf() && exists("*fugitive#head") && fugitive#head() != ''
    let head = fugitive#head()
    let head = strlen(head) > 0 ? head :"[Empty]"
    " let hunks = GitGutterGetHunkSummary()
    " let hunks[0] = '˖' . hunks[0]
    " let hunks[1] = '∼' . hunks[1]
    " let hunks[2] = '-' . hunks[2]
    return '%#StatLnM#%{"   "}%#StatLnM#%{"'.head.'"}'
    " return '%#StatLnM#%{"  "}%#StatLnM#%{"'.head.'"}'
    " return '%#StatLnM#%{"' . join(hunks, ' ') . '  "}%#StatLnM#%{"'.head.'"}'
  endif
  return ''
endfu

fu! s:rbver()
  if s:regularbuf() && (RailsDetect() || &ft==#"ruby")
    let rbver = substitute(matchstr($GEM_HOME,'[^/]*$'),'^\[\]$','','')
    return '%#RbIconM#%{"  "}%#StatLnM#%{"'.rbver.'"}'
    " return '%#RbIconM#%{" "}%#StatLnM#%{"'.rbver.'"}'
  endif
  return ''
endfu

fu! s:first_err()
  if get(w:, 's_err_count', 0) == 0 || !exists('w:s_errors') | return '' | endif
  let err_text = w:s_errors[0].text
  if strlen(err_text) > g:max_err_len
    let err_text = substitute(err_text, '\<.', '\u&', '')[:g:max_err_len-2]
    let err_text .= '…'
  endif
  return '['.err_text.']'
endfu

fu! s:err()
  let ec = get(w:, 's_err_count', '')
  if ec > 0
    return '%#ErrIconM#%{"• "}%#StatLnM#%{"'.ec.'"}'
  endif
  return ''
endfu

fu! s:warn()
  let wc = get(w:, 's_warn_count', '')
  if wc > 0
    return '%#WarnIconM#%{"• "}%#StatLnM#%{"'.wc.'"}'
  endif
  return ''
endfu

fu! s:percent()
  return s:regularbuf() ? '%3p%%' : ''
endfu

fu! s:search_stat()
  return s:regularbuf() ? anzu#search_status() : ''
endfu

fu! s:lineinfo()
  return  s:regularbuf() ? '%3l:%-3v' : ''
endfu

fu! s:regularbuf()
  return expand('%:t') !~? '__Gundo\|NERD_tree\|__Tagbar__\|ControlP'
endfu

fu! s:modified()
  return &ft =~ 'help' || !s:regularbuf() ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfu

fu! s:relpath()
  return &ft =~ 'help' || !s:regularbuf()  ? '' : substitute(expand('%:~:.:h'), '\%(fugitive://\)\?'.$PWD.'/', '', '')
endfu

fu! s:abspath()
  return &ft =~ 'help' || !s:regularbuf()  ? '' : substitute(expand('%:p:~'), '\%(fugitive://\)\?'.$PWD.'/', '', '')
endfu

fu! s:readonly()
  return &ft !~? 'help' && &readonly ? 'r' : ''
  " return &ft !~? 'help' && &readonly ? '' : ''
endfu

fu! s:fname()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != s:readonly() ? s:readonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfu

fu! s:ctrlps1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfu

let g:ctrlp_status_func = {
  \ 'prog': s:SID.'ctrlps2',
  \ 'main': s:SID.'ctrlps1',
  \ }
fu! s:ctrlps2(str)
  return lightline#statusline(0)
endfu

fu! s:tagbar(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfu
let g:tagbar_status_func = s:SID.'tagbar'

fu! s:mode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfu

fu! s:rvmrbver()
  if &filetype ==# 'ruby' && exists('$RUBY_VERSION')
    return '[' . $RUBY_VERSION . ']'
  else
    return ''
  endif
endfu

fu! s:fticon(tabnum)
  let fticon = WebDevIconsGetFileTypeSymbol()
  return strlen(&filetype) && fticon != g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol ? fticon : ''
endfu

fu! s:filetype()
  return winwidth(0) > 70 && s:regularbuf() ? (strlen(&filetype) ? printf('%3s %1s', &ft, WebDevIconsGetFileTypeSymbol()) : 'no ft') : ''
  " return winwidth(0) > 70 && s:regularbuf() ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfu
