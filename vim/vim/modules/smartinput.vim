call smartinput#clear_rules()
call smartinput#define_default_rules()
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#map_to_trigger('i', ':', ':', ':')


nnoremap <SID>  <SID>
let s:cr = '<C-r>='.maparg('<SID>', 'n').'close_popup()<CR>'


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
      \   '[]': [
      \     {     'at': '\%#[@a-zA-Z0-9"'''']',    'char': '[',       'input': '[', },
      \   ],
      \   '""': [
      \     {     'at': '\%#[@a-zA-Z0-9'''']',     'char': '"',       'input': '"', },
      \   ],
      \   '{}': [
      \     {     'at': '\%#[@a-zA-Z0-9"'''']',    'char': '{',       'input': '{<Left><Right>', },
      \     {     'at': '{\%#}',                   'char': '<Space>', 'input': '<Space><Space><Left>'},
      \   ],
      \   'rb': [
      \     {     'at': '\<\%(if\|unless\)\>.*\%#',               'char': '<CR>',    'input': s:cr.'end<Esc>O', 'syntax': ['rubyConditionalExpression']},
      \     {     'at': '^\s*\%(module\|def\|class\|if\|unless\|for\|while\|until\|case\)\>\%(.*[^.:@$]\<end\>\)\@!.*\%#', 'char': '<CR>', 'input': s:cr.'end<Esc>O' },
      \     {     'at': '^\s*\%(begin\)\s*\%#', 'char': '<CR>', 'input': s:cr.'end<Esc>O'},
      \     {     'at': '\%(^\s*#.*\)\@<!do\%(\s*|\k\+\%(\s*,\s*\k\+\)*|\)\?\s*\%#', 'char': '<CR>', 'input': s:cr.'end<Esc>O'},
      \   ],
      \   'vim': [],
      \   'css': [
      \     {     'at': '\w\+\%#\%($\|[^;]\)', 'char': ':', 'input': ':<Space>;<Left>', 'syntax': ['cssDefinition'] },
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


call smartinput#define_rule({
\   'at': '<%\%#',
\   'char': '<Space>',
\   'input': '%><Left><Left>',
\   'filetype': ['eruby'],
\ })


