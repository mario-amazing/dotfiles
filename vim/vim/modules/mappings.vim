nnoremap <leader>yg  :<C-u>call feedkeys(':YamlGoToKey '.@", 'n')<CR>
nnoremap <leader>yy  :<C-u>call <SID>read_path()<CR>
fu! s:read_path()
  redir @">
  YamlGetFullPath
  redir END
  call setreg('"', substitute(getreg('"'), "\<C-j>", '', 'g'), 'V')
endfu


vnoremap <Leader>t, :Tabularize/,\zs<CR>
vnoremap <Leader>t: :Tabularize/:\zs<CR>
vnoremap <Leader>t= :Tabularize/=<CR>

nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
nnoremap = ==

vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap <S-y> ygv

nnoremap <Leader>f<S-s> :%S/
vnoremap <Leader>f<S-s> :S/
nnoremap <silent> <Leader>fs :OverCommandLine<CR>%s/
vnoremap <silent> <Leader>fs :OverCommandLine<CR>s/

cabbrev trw :call TrimWhiteSpace()

" #insert mode motions
inoremap <C-d> <Delete>
inoremap <M-b> <S-Left>
inoremap <M-f> <S-Right>

" #Commandline
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <down>
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

cabbrev Tab Tabularize


command! -bang -nargs=0 Q call ExitFugitive('q<bang>')
cabbrev ga   Git add
cabbrev gc  Git commit -m
cabbrev gca Git commit --amend -m
cabbrev gco  Git checkout
cabbrev gcof Git checkout "%:p:h"

map ё `| map й q| map ц w| map у e| map к r| map е t| map н y| map г u| map ш i| map щ o| map з p| map х [| map ъ ]
map ф a| map ы s| map в d| map а f| map п g| map р h| map о j| map л k| map д l| map ж ;| map э '| map я z| map ч x
map с c| map м v| map и b| map т n| map ь m| map б ,| map ю .| map Ё ~| map Й Q| map Ц W| map У E| map К R| map Е T
map Н Y| map Г U| map Ш I| map Щ O| map З P| map Х {| map Ъ }| map Ф A| map Ы S| map В D| map А F| map П G| map Р H
map О J| map Л K| map Д L| map Ж :| map Э "| map Я Z| map Ч X| map С C| map М V| map И B| map Т N| map Ь M| map Б <
map Ю >

set spelllang=ru_yo,en_us


let g:endwise_no_mappings = 1

" au VimEnter * call Aaaaa()


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


nmap <F9> :%!ruby -r json -e 'puts JSON.pretty_generate(JSON.parse(ARGF.read))'<CR><CR>


nnoremap yn :let @+ = substitute(expand("%"), '^'.getcwd().'/', '', '')<CR>
nnoremap yN :let @+ = expand("%:t")<CR>
" python
nnoremap yp :let @+ = tr(expand('%:r'), '/', '.')<CR>
nnoremap ypi :let @+ = "import " . tr(expand('%:r'), '/', '.')<CR>
nnoremap ypf :let @+ = "from " . tr(expand('%:r'), '/', '.') . " import "<CR>


nmap <leader>rr :call RunCurrentSpecFile()<CR>

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


let g:smartgf_strategies = [function('TryURI'), function('TryPlainGF'), function('TryRailsCFile'), function('TryCTag'), function('TryFootnote')]

nmap <silent> gf :<C-u>call SmartGF()<CR>
xmap <silent> gf :<C-u>call SmartGF()<CR>gv
nmap <silent> gn :tnext<CR>
xmap <silent> gn :tnext<CR>
