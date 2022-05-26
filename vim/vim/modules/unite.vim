call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,mru,buffer,file_rec,line,grep,outline', 'matchers', 'matcher_fuzzy')

call unite#custom#source('rails', 'matchers', 'matcher_start')
call unite#custom#profile('rails', 'context', {
      \ 'immediately': 1,
  \ })

" \ 'marked_icon': '» ',
" \ 'candidate_icon': '› ',
" \ 'prompt': '❯: ',

let g:unite_prompt = '>>> '
let g:unite_marked_icon = '✓'
let g:unite_split_rule = 'botright'
let g:unite_data_directory='~/.vim/tmp/cache/unite'
let g:unite_force_overwrite_statusline = 0


augroup UniteSettings
  au!
  au FileType unite call s:unite_settings()
augroup END

function! s:unite_settings()
  resize 10
  cclose
  lclose
  setlocal winfixwidth
  nmap      <silent><buffer> Q <plug>(unite_exit)
  nmap      <silent><buffer> <esc> <plug>(unite_exit)
  imap      <silent><buffer> <esc> <plug>(unite_exit)
  imap      <silent><buffer> <C-j>   <Plug>(unite_select_next_line)
  imap      <silent><buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap      <silent><buffer> <C-c>   <Esc>
  inoremap <silent><buffer><expr> <C-x>     unite#do_action('split')
  inoremap <silent><buffer><expr> <C-f>     unite#do_action('preview')
endfu

function! s:UniteBuffFilter(candidates, context)
  call filter(a:candidates, "!empty(bufname(v:val.action__buffer_nr))")
  let a:context.source.name =  a:context.source.name[0]
  for candidate in a:candidates
    let candidate.abbr = fnamemodify(bufname(candidate.action__buffer_nr), ':~:.')
    let candidate.word = candidate.abbr
  endfor
  return a:candidates
endfu

function! s:UniteMRUFilter(candidates, context)
  let a:context.source.name = 'f'
  for candidate in a:candidates
    let candidate.word = fnamemodify(candidate.word, ':~:.')
  endfor
  return a:candidates
endfu

fu! s:UniqByWord(candidates,...)
  call Db(len(a:candidates), len(unite#util#uniq_by(a:candidates, 'v:val.word')) )
  return unite#util#uniq_by(a:candidates, 'v:val.word')
endfu

call unite#define_filter({'name': 'uniq_by_word', 'filter': function('s:UniqByWord')})
call unite#custom#profile('files', 'filters', 'uniq_by_word')
call unite#custom#profile('default', 'context', {
      \ 'winheight': 10,
      \ 'prompt_direction': 'below',
      \ 'direction': 'botright',
  \ })

call unite#define_filter({'name': 'buff_filter', 'filter': function('s:UniteBuffFilter')})
call unite#define_filter({'name': 'mru_filter', 'filter': function('s:UniteMRUFilter')})
call unite#custom#source('buffer', 'converters', 'buff_filter')
call unite#custom#source('neomru/file', 'converters', 'mru_filter')
" call unite#custom#source('neomru/file', 'sorters', ['sorter_ftime', 'sorter_reverse'])

let my_open = { 'is_selectable' : 1 }
function! my_open.func(candidates)
  let nr = -1
  for winnr in range(1, tabpagewinnr(tabpagenr(), '$'))
    let bnr = winbufnr(winnr)
    if bufname(bnr) !~# 'NERD' && getbufvar(bnr, '&modified') == 0
      let nr = winnr
      break
    endif
  endfor
  exe (nr >= 0 ? nr.'wincmd w' : tabpagewinnr(tabpagenr(), '$').'wincmd w | split')
  call unite#take_action('open', a:candidates)
endfu

" call unite#custom#action('file,buffer,conf', 'open', my_open)
" call unite#custom#action('outline,common,openable,cdable,file_base,file_vimfiler_base,file,buffer,tab,directory,word,jump_list,command,window,completion,source,uri,guicmd', 'open', my_open)
" common,openable,cdable,file_base,file_vimfiler_base,file,buffer,tab,directory,word,jump_list,command,window,completion,source,uri,guicmd
" call unite#custom#action('common,openable', 'open', my_open)
unlet my_open

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.conf = {
      \ 'description' : 'Config modules'
      \}

" let g:unite_source_menu_menus.sheet = {
"       \ 'description' : 'Cheatsheets'
"       \}


" let g:unite_source_menu_menus..command_candidates = [
"   \ [ 'faker', 'split ~/.vim/cheat/faker' ],
" ]

let g:unite_source_menu_menus.conf.command_candidates = [
        \ [ 'init.lua', 'split ~/.vim/modules/init.lua' ],
        \ [ 'misc', 'split ~/.vim/modules/misc.vim' ],
        \ [ 'unite', 'split ~/.vim/modules/unite.vim' ],
        \ [ 'colors', 'split ~/.vim/modules/colors.lua' ],
        \ [ 'helpers', 'split ~/.vim/modules/helpers.vim' ],
        \ [ 'optins', 'split ~/.vim/modules/options.vim' ],
        \ [ 'plugins', 'split ~/.vim/modules/plugins.vim' ],
        \ [ 'statusline', 'split ~/.vim/modules/statusline.vim' ],
        \ [ 'mappings', 'split ~/.vim/modules/mappings.vim' ],
        \ [ 'bundles', 'split ~/.vim/modules/bundles.vim' ],
        \ [ 'autocmds', 'split ~/.vim/modules/autocmds.vim' ],
        \ [ 'completion', 'split ~/.vim/modules/completion.vim' ],
        \ [ 'ncompletion', 'split ~/.vim/modules/ncompletion.vim' ],
        \ [ 'smartinput', 'split ~/.vim/modules/smartinput.vim' ],
      \ ]

" call unite#custom#profile('default', 'context', {
" \ 'start_insert': 1,
" \ 'immediately': 1,
" \ })
