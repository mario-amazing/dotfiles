fu! s:SID()
  return matchstr(expand('<sfile>'), '\zs<SNR>\d\+_\zeSID$')
endfun
set laststatus=2
set noshowmode
let g:Powerline_symbols = 'fancy'
if has('nvim')
  fu! s:read_gemhome(_, data)
    let $GEM_HOME = a:data[0]
  endfu
  "let $GEM_HOME = ''
  let $GEM_HOME = system('env -i PATH="'.$PATH.'" ruby -rubygems -e "print Gem.dir"')
  " call jobstart('env -i PATH="'.$PATH.'" ruby -rubygems -e "print Gem.dir"', {'on_stdout': function('s:read_gemhome')})
else
  let $GEM_HOME = system('env -i PATH="'.$PATH.'" ruby -rubygems -e "print Gem.dir"')
endif
let s:SID = s:SID()


" \ 'fname':    '%-010.20t' 'relpath', 
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'spell', 'fnameactive', 'modified'], [ 'search_stat' ]],
      \   'right': [['percent', 'lineinfo'], [ 'filetype'], 
                  \ ['first_err', 'err', 'warn', 'git', 'rbver']],
      \ },
      \ 'inactive': {
      \   'left': [[], [ 'lpadding', 'filename', 'modified'], []],
      \   'right': [[], ['filetype', 'rpadding']]
      \ },
      \ 'tabline': {
      \   'left':  [[ 'tabs' ]],
      \   'right': [[]]
      \ },
      \ 'tab': {
      \   'active':   [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'component': {
      \ 'rpadding': '%{"'.repeat(' ', 14).'"}',
      \ 'lpadding': '%{" "}',
      \ },
      \ 'component_function': {
      \   'filetype':     s:SID."filetype",
      \   'relpath':      s:SID."relpath",
      \   'abspath':      s:SID."abspath",
      \   'rvm':          s:SID.'rvmrbver',
      \   'search_stat':  s:SID.'search_stat',
      \   'modified':     s:SID.'modified',
      \   'mode':         s:SID.'mode',
      \   'filename':     s:SID.'fname',
      \   'percent':    'Hud',
      \ },
      \ 'tab_component_function': {
      \   'fticon': s:SID.'fticon'
      \ },
      \ 'component_expand': {
      \   'fnameactive':     s:SID.'fnameactive',
      \   'lineinfo':   s:SID.'lineinfo',
      \   'first_err':  s:SID.'first_err',
      \   'warn':       s:SID.'warn',
      \   'err':        s:SID.'err',
      \   'rbver':      s:SID.'rbver',
      \   'git':        s:SID.'git',
      \ },
      \ 'component_type': {
      \ },
      \ 'separator':            { 'left': '', 'right': '' },
      \ 'subseparator':         { 'left': '', 'right': '' },
      \ 'tabline_separator':    { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '', 'right': '' },
      \ 'mode_map': {
      \   'layout' : '--- LAYOUT EDITING ---',
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
"
"
"
"
try
  let s:p =  g:lightline#colorscheme#{g:lightline.colorscheme}#palette
catch
  finish
endtry
let s:rbicon   = [['', '', 203]]
let s:erricon  = [['', '', 1  ]]
let s:warnicon = [['', '', 3  ]]
let s:middle   = get(s:p.normal, 'middle', [['', '', 248, 8]])
exe 'hi RbIconM   ctermfg='.get(s:p.normal, 'rbicon'  , s:rbicon  )[0][2].' ctermbg='.s:middle[0][3]
exe 'hi ErrIconM  ctermfg='.get(s:p.normal, 'erricon' , s:erricon )[0][2].' ctermbg='.s:middle[0][3]
exe 'hi WarnIconM ctermfg='.get(s:p.normal, 'warnicon', s:warnicon)[0][2].' ctermbg='.s:middle[0][3]
exe 'hi StatLnM   ctermfg='.s:middle[0][2]                               .' ctermbg='.s:middle[0][3]
unlet s:middle



fu! s:git()
  if s:regularbuf() && exists("*fugitive#head") && fugitive#head() != ''
    let head = fugitive#head()
    let head = strlen(head) > 0 ? head :"[Empty]"
    " let hunks = GitGutterGetHunkSummary()
    " let hunks[0] = '˖' . hunks[0]
    " let hunks[1] = '∼' . hunks[1]
    " let hunks[2] = '-' . hunks[2]
    return '%#StatLnM#%{"  "}%#StatLnM#%{"'.head.'"}'
    " return '%#StatLnM#%{"' . join(hunks, ' ') . '  "}%#StatLnM#%{"'.head.'"}'
  endif
  return ''
endfu

fu! s:rbver()
  if s:regularbuf() && (RailsDetect() || &ft==#"ruby") && exists('$GEM_HOME')
    if $GEM_HOME =~# 'gemsets'
      let rbver = fnamemodify($GEM_HOME, ':h:h:t')
    else
      let rbver = fnamemodify($GEM_HOME, ':t')
    endif

    return '%#RbIconM#%{" "}%#StatLnM#%{"'.rbver.'"}'
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


" fu! s:percent()
"   return s:regularbuf() ? '%3p%%' : ''
" endfu
let g:marginal = '⬛'
let g:placeholder = ' '
let s:fmt = '▕%s▎'
let s:fmt = '%s'
fu! s:percent() abort
  let frs = ['▏', '▎', '▍', '▌', '▋', '▊', '▉', '█']
  " let frs = ['▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']
  " let frs = ['▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██']
  " let frs = [ '▱', '▰' ]
  " let frs = ['◔', '◑', '◕', '●']
  " let frs = ['🞗', '🞘', '🞙', '◆']
  " let frs = ['▭', '▬']
  " let frs = ['□', '■']
  " let frs = ['⬚', '□','▤', '▦', '■']
  " let frs = ['⬚', '□','▨', '▩', '■']


  let lcurr = line('.')
  let llast = line('$')
  let barsmax = 14

  if !s:regularbuf()
    return ''
  elseif lcurr == 1
    return printf(s:fmt,repeat(g:placeholder, barsmax))
  elseif lcurr == llast
    return printf(s:fmt, repeat('▓', barsmax))
  endif

  let percent =  line('.') * 1.0 / line('$')
  let nbars =  float2nr(percent * barsmax)

  let nfrs = float2nr(percent * barsmax * len(frs)) % len(frs)
  let rpadding =  barsmax - nbars - 1
  " return  string([nbars, nfrs, rpadding])
  return printf(s:fmt, repeat(frs[-1], nbars) . frs[nfrs] . repeat(g:placeholder, rpadding))
endfu

fu! s:lineinfo()
  return  s:regularbuf() ? '%3l:%-2v' : ''
endfu

fu! s:search_stat()
  return s:regularbuf() ? anzu#search_status() : ''
endfu

fu! s:regularbuf()
  return expand('%:t') !~? '__Gundo\|NERD_tree\|__Tagbar__\|ControlP' && &ft !~# 'gitcommit\|unite'
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
  return &ft !~? 'help' && &readonly ? '' : ''
endfu

fu! s:fname(...)
  " let name = a:0 ? a:1 : escape(expand('%:.'), '}')
  " let name = a:0 ? a:1 : get(g:lightline, 'fname', '')
  " TODO
  " let name = a:0 ? a:1 : substitute(expand("%:."), '}', '❵', 'g')
  let name = expand("%:.")
  " let name = a:0 && name  ? substitute(a:1, '}', '❵', 'g') : 
  " since fnamemodify can't properly handle this case
  let name = substitute(name, '\%(fugitive://\)\?'.$PWD.'/', '', '')
  let name = substitute(name, $HOME, '~', '')
  " let fname = expand('%:t')
  let fname = expand('%')
  return fname == 'ControlP' ? get(g:lightline, 'ctrlp_item', '_') :
        \ fname == '__Tagbar__' ? get(g:lightline, 'fname', '') :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ exists('w:quickfix_title') ? w:quickfix_title :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != s:readonly() ? s:readonly() . ' ' : '') .
        \ (len(fname) ? name : '[No Name]')
endfu

fu! s:fnameactive()
  let rel = expand('%:h')
  let rel = '.' ==# rel ? '': rel.'/'
  " TODO improve hightlights (filename - bright, relpath - pale)
  let name = '%#LightLineRight_active_1#%{"'.rel.'"}%#LightLineLeft_active_1#%{"'.expand('%:t').'"}'
  return s:fname(name)
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
  let submode = submode#current()
  if submode ==# 'layout'
    call lightline#link('R')
  endif
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'qf' ? ' ' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ len(submode) ? get(g:lightline.mode_map, submode, g:lightline.mode_map['?']) :
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
  return winwidth(0) > 70 && s:regularbuf() ? (strlen(&filetype) ? printf('%3s', &ft) : 'no ft') : ''
  " return winwidth(0) > 70 && s:regularbuf() ? (strlen(&filetype) ? printf('%3s %1s', &ft, WebDevIconsGetFileTypeSymbol()) : 'no ft') : ''
  " return winwidth(0) > 70 && s:regularbuf() ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfu
