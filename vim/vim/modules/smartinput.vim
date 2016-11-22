nnoremap <SID>  <SID>
let s:sid = maparg('<SID>', 'n')

let s:cr = '<C-r>='.s:sid.'close_popup()<CR>'

call smartinput#clear_rules()
call smartinput#define_default_rules()
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
" call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
" call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar><Esc>:call'.s:sid.'align()<Bar>echo""<CR>a')
call smartinput#map_to_trigger('i', ':', ':', ':')

let s:rules =
      \ {
      \   '()': [
      \     {     'at': '(\%#)',                   'char': '<Space>', 'input': '<Space><Space><Left>' },
      \     {     'at': '(\s\%#\s)',               'char': '<BS>',    'input': '<BS><Del>' },
      \     {     'at': '\%#[@a-zA-Z0-9"'''']',    'char': '(',       'input': '(', },
      \     {     'at': '(\%#)',                   'char': '<Space>', 'input': '<Space><Space><Left>' },
      \   ],
      \   "''": [
      \     {     'at': '\%#[@a-zA-Z0-9"]',        'char': "'",       'input': "'", },
      \   ],
      \   "html": [
      \     {     'at': '>\s*\%#\s*</\w',        'char': "<Enter>",       'input': "<Enter><Esc>O", },
      \   ],
      \   '[]': [
      \     {     'at': '\%#[@a-zA-Z0-9"'''':]',    'char': '[',       'input': '[', },
      \   ],
      \   '""': [
      \     {     'at': '\%#[@a-zA-Z0-9''''{]',     'char': '"',       'input': '"', },
      \     {     'at': '[@a-zA-Z0-9/''''}"]\%#[^"]',     'char': '"',       'input': '"', },
      \   ],
      \   '{}': [
      \     {     'at': '\%#[@a-zA-Z0-9"'''']',    'char': '{',       'input': '{<Left><Right>', },
      \     {     'at': '{\%#}',                   'char': '<Space>', 'input': '<Space><Space><Left>'},
      \   ],
      \   'rb': [
      \     {     'at': '\<\%(if\|unless\)\>.*\%#[^\s]\+',               'char': '<CR>',    'input': s:cr.'<Esc>belvwhs<CR><Esc>oend<Esc>kA', 'syntax': ['rubyConditionalExpression']},
      \     {     'at': '\<\%(if\|unless\)\>.*\%#',               'char': '<CR>',    'input': s:cr.'end<Esc>O', 'syntax': ['rubyConditionalExpression']},
      \     {     'at': '^\s*\%(module\|def\|class\|if\|unless\|for\|while\|until\|case\)\>\%(.*[^.:@$]\<end\>\)\@!.*\%#[^\s]\+', 'char': '<CR>', 'input': s:cr.'<Esc>belvwhs<CR><Esc>oend<Esc>kA' },
      \     {     'at': '^\s*\%(module\|def\|class\|if\|unless\|for\|while\|until\|case\)\>\%(.*[^.:@$]\<end\>\)\@!.*\%#', 'char': '<CR>', 'input': s:cr.'end<Esc>O' },
      \     {     'at': '^\s*\%(begin\)\s*\%#', 'char': '<CR>', 'input': s:cr.'end<Esc>O'},
      \     {     'at': '^\s*\%(begin\)\s*\%#[^\s]\+', 'char': '<CR>', 'input': s:cr.'<Esc>belvwhs<CR><Esc>oend<Esc>kA'},
      \     {     'at': '\%(^\s*#.*\)\@<!do\%(\s*|\k\+\%(\s*,\s*\k\+\)*|\)\?\s*\%#', 'char': '<CR>', 'input': s:cr.'end<Esc>O'},
      \   ],
      \   'vim': [],
      \   'css': [
      \     {     'at': '\w\+\%#\%($\|\s*[^;{]\)', 'char': ':', 'input': ':<Space>;<Left>', 'syntax': ['cssDefinition', 'scssDefinition'] },
      \     {     'at': '\w\+\%#;',                'char': ':',            'input': ':<Space>', 'syntax': ['cssDefinition', 'scssDefinition'] },
      \     {     'at': '\w\+:\%#\s;',             'char': '<Space>',   'input': '<Right>', 'syntax': ['cssDefinition', 'scssDefinition'] },
      \     {     'at': '\w\+:\s\{2,}\%#;',        'char': '<BS>', 'input': '<Esc>cT:<Right>', 'syntax': ['cssDefinition', 'scssDefinition'] },
      \   ],
      \   'sh': [
      \     {     'at': '^\s*if\>.*\%#',            'char': '<CR>', 'input': '<CR>fi<Esc>O' },
      \     {     'at': '^\s*case\>.*\%#',          'char': '<CR>', 'input': '<CR>esac<Esc>O' },
      \     {     'at': '\%(^\s*#.*\)\@<!do\>.*\%#','char': '<CR>', 'input': '<CR>done<Esc>O' }
      \   ],
      \   '||': [
      \     {     'at': '\<do\>\s*|.*[^,]\%#|',    'char': '<CR>', 'input': '<Right><Enter>end<Esc>O'},
      \     {     'at': '\<do\>\s*|\%#|',          'char': '<CR>', 'input': '<Right><Enter>end<Esc>O'},
      \     {     'at': '\%({\|\<do\>\)\s*\%#',    'char': '<Bar>',   'input': '<Bar><Bar><Left>'},
      \     {     'at': '\%({\|\<do\>\)\s*|\%# |', 'char': '<BS>',    'input': '<BS><Del><Del>'},
      \     {     'at': '\%({\|\<do\>\)\s*|\%# |', 'char': '<BS>',    'input': '<BS><Del><Del>'},
      \     {     'at': '{\s*|.*[^,]\%#|',         'char': '<Space>', 'input': '<Right><Space>'},
      \     {     'at': '|\%#|',                   'char': '<Space>', 'input': '<Space><Space><Left>'},
      \     {     'at': '\%#\_s*|',                'char': '|',       'input': '<C-r>=smartinput#_leave_block(''|'')<Enter><Right>'},
      \     {     'at': '|\%#|',                   'char': '<BS>',    'input': '<BS><Del>'},
      \     {     'at': '| \%# |',                 'char': '<BS>',    'input': '<BS><Del>'},
      \     {     'at': '||\%#',                   'char': '<BS>',    'input': '<BS><BS>'},
      \     {     'at': '\\\%#',                   'char': '|',       'input': '|'},
      \     {     'at': '|\%#|',                   'char': '<Enter>', 'input': '<Enter><Enter><Up><Esc>"_S'},
      \   ],
      \ }
for at in ['fu', 'func', 'function', 'if', 'wh', 'while', 'for', 'try']
  call add(s:rules['vim'], { 'at': '^\s*'.at.'\>.*\%#', 'char': '<CR>', 'input': '<CR>end'.at.'<Esc>O'})
endfor

let s:ftrules = [
      \   { 'rules':     ['()', '{}', "''", '""', '[]'] },
      \   { 'filetypes': ['ruby', 'eruby'], 'rules': ['||'] },
      \   { 'filetypes': ['ruby'], 'rules': ['rb'] },
      \   { 'filetypes': ['vim'], 'rules': ['vim'] },
      \   { 'filetypes': ['sh', 'zsh'], 'rules': ['sh'] },
      \   { 'filetypes': ['html', 'eruby', 'css', 'sass', 'scss', 'slim', 'haml'], 'rules': ['css'] },
      \   { 'filetypes': ['html', 'eruby'], 'rules': ['html'] },
      \ ]

for frule in s:ftrules
  for rule_name in frule.rules
    if has_key(frule, 'filetypes')
      for rule in s:rules[rule_name]
        call smartinput#define_rule(extend(copy(rule), {'filetype': frule.filetypes}))
      endfor
    else
      for rule in s:rules[rule_name]
        call smartinput#define_rule(rule)
      endfor
    endif
  endfor
endfor

unlet s:rules s:ftrules

nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

fu! s:close_popup()
  if exists('*deoplete#mappings#close_popup')
    return "\<C-r>=deoplete#mappings#close_popup()\<CR>\<CR>"
  elseif exists('*neocomplete#close_popup')
    return "\<C-r>=neocomplete#close_popup()\<CR>\<CR>"
  else
    return "\<CR>"
  endif
endfu

let s:ftcomments = {
      \   'ruby': '#',
      \   'vim':  '"'
      \ }

function! s:align()
  let p1 = '^\s*' . (has_key(s:ftcomments, &ft) ? s:ftcomments[&ft].'*':'') .'\s*|'
  let p =  p1.'\s*.*\s*|\s*$'
  let curline = getline('.')
  let curcol = col('.')
  if exists(':Tabularize') && curline =~# p1 && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(curline[0:curcol],'[^|]','','g'))
    let position = strlen(matchstr(curline[0:curcol],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

call smartinput#define_rule({
\   'at': '<%\%#',
\   'char': '<Space>',
\   'input': '%><Left><Left>',
\   'filetype': ['eruby'],
\ })


