" Helpers
function! s:incsearch_fuzzy(...) abort
  return extend(copy({'converters': [incsearch#config#fuzzy#converter(), incsearch#config#fuzzyspell#converter() ]}), get(a:, 1, {}))
endfunction
fu! s:alias(to, from)
  exe 'nmap '.a:from.' '.a:to
  exe 'nnoremap '.a:to.' <Nop>'
endfu
fu! s:map_ctrl(map, keys, cmd)
  let key_pos = len(a:keys)-2
  exe a:map.' <silent> '.a:keys.' '.a:cmd
  exe a:map.' <silent> '.a:keys[:key_pos].'<C-'.a:keys[key_pos+1].'> '.a:cmd
endfu

if has('nvim')
  call s:alias('[shftf2]', '<S-F2>')
  call s:alias('[shftf3]', '<S-F3>')
else
  call s:alias('[shftf2]', '<Esc>[1;2Q')
  call s:alias('[shftf3]', '<Esc>[1;2R')
endif

let g:mapleader = ','
let g:user_emmet_leader_key = '<Leader>'

" #Completion
cmap     <C-P> <Plug>CmdlineCompletionForward
cmap     <C-N> <Plug>CmdlineCompletionBackward
cmap     <c-o> <Plug>(unite_cmdmatch_complete)
" imap     <C-k>  <Plug>(neocomplete_start_unite_complete)

" #Navigation
  " ,tree
  " let NERDTreeMapJumpNextSibling = "\<C-w>j"
  " let NERDTreeMapJumpPrevSibling = "\<C-w>k"
  nnoremap <silent> <Leader>t  ::NERDTreeMirrorToggle<CR>
  " nnoremap <silent> <Leader>t  :NERDTreeTabsToggle<CR>
  nnoremap <silent> <Leader>ft :NERDTreeFind<CR>
  " nnoremap <silent> <Leader>ft :NERDTreeTabsFind<CR>
  nnoremap <C-r>      :Unite -buffer-name=outline -start-insert outline<CR>

  " nnoremap <F9>       :call GenerateCtags()<CR>
  nnoremap <F2>       :TagbarToggle<CR>
  nnoremap <Leader>fb :CtrlPLine<CR>
  nnoremap <Leader>e  :call RailsCommands(g:rails_commands, g:rails_edit_mappings, 'CtrlP %s')<CR>
  " nnoremap <leader>rr :!rake<CR>

  " ,search
  " nnoremap <C-f><C-d> :<C-u>CtrlPNerdTree<CR>
  nnoremap <C-f><C-d> :<C-u>CtrlPNerdTree<CR>
  nnoremap <leader>rc :CtrlPControllers<CR>
  nnoremap <leader>rm :CtrlPModels<CR>
  nnoremap <leader>rs :CtrlPSpecs<CR>
  nnoremap <leader>rv :CtrlPViews<CR>
  call   esearch#map('<C-f><C-f>','esearch')
  call   esearch#map('<C-f>f',    'esearch')
  call   esearch#map('<Leader>ff','esearch')

  let g:vim_search_pulse_disable_auto_mappings = 1
  nnoremap               <Leader>fl   :Unite -buffer-name=search\ line -start-insert line<CR>
  nnoremap               <C-f>l       :Unite -buffer-name=search\ line -start-insert line<CR>
  map                    /            <Plug>(incsearch-forward)
  map                    ?            <Plug>(incsearch-backward)
  map                    g/           <Plug>(incsearch-stay)
  map     <silent>       #            <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)<Plug>(anzu-echo-search-status)<Plug>Pulse
  map     <silent>       *            <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)<Plug>(anzu-echo-search-status)<Plug>Pulse
  map     <silent>       g*           <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)<Plug>(anzu-echo-search-status)<Plug>Pulse
  map     <silent>       g#           <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)<Plug>(anzu-echo-search-status)<Plug>Pulse
  map                    N            <Plug>(incsearch-nohl)<Plug>(anzu-N)zz<Plug>Pulse
  map                    n            <Plug>(incsearch-nohl)<Plug>(anzu-n)zz<Plug>Pulse
  nnoremap               <CR>         :nohl<Bar>AnzuClearSearchStatus<CR>:<Esc>
  noremap <silent><expr> z/           incsearch#go(<SID>incsearch_fuzzy())
  noremap <silent><expr> z?           incsearch#go(<SID>incsearch_fuzzy({'command': '?'}))
  noremap <silent><expr> zg?          incsearch#go(<SID>incsearch_fuzzy({'is_stay': 1}))
  " nnoremap               /            :<C-U>if get(v:, 'hlsearch', 0)<Bar>call feedkeys("/\<C-R>/")<Bar>else<Bar>call feedkeys('/')<CR>
  vmap                   /            *
  augroup IncsearchAu
    au!
    au User IncSearchLeave  AnzuUpdateSearchStatus
    au VimEnter * exe 'IncSearchNoreMap <C-p> <Over>(buffer-complete)' | exe 'IncSearchNoreMap <C-n> <Over>(buffer-complete-prev)'
  augroup END
  nmap  [shftf3] <S-n>
  nnoremap <F3> n


  nnoremap <leader>yg  :<C-u>call feedkeys(':YamlGoToKey '.@", 'n')<CR>
  nnoremap <leader>yy  :<C-u>call <SID>read_path()<CR>
  fu! s:read_path()
    redir @">
    YamlGetFullPath
    redir END
    call setreg('"', substitute(getreg('"'), "\<C-j>", '', 'g'), 'V')
  endfu

  " ,motion
  nnoremap <C-t> :tabnew<CR>
  nnoremap <silent> <C-i> <C-i>zz
  nnoremap <silent> <C-o> <C-o>zz
  map <C-\>123123123 <Plug>(easymotion-prefix)
  " nmap <C-g>/ <Plug>(easymotion-sn)
  " nmap <C-g>l <Plug>(easymotion-iskeyword-w)
  " nmap <C-g>h <Plug>(easymotion-iskeyword-b)
  " nmap <C-g><C-l> <Plug>(easymotion-iskeyword-w)
  " nmap <C-g><C-h> <Plug>(easymotion-iskeyword-b)
  nmap gh <Plug>(easymotion-iskeyword-b)
  nmap gl <Plug>(easymotion-iskeyword-w)
  nmap gj <Plug>(easymotion-j)
  nmap gk <Plug>(easymotion-k)
  xmap gh <Plug>(easymotion-iskeyword-b)
  xmap gl <Plug>(easymotion-iskeyword-w)
  xmap gj <Plug>(easymotion-j)
  xmap gk <Plug>(easymotion-k)
  nmap <C-g> %

  " map <Plug>(smartword-basic-w)  <Plug>CamelCaseMotion_w
  " map <Plug>(smartword-basic-b)  <Plug>CamelCaseMotion_b
  " map <Plug>(smartword-basic-e)  <Plug>CamelCaseMotion_e
  " nmap w  <Plug>(smartword-w)
  " nmap b  <Plug>(smartword-b)
  " nmap e  <Plug>(smartword-e)
  " nmap ge  <Plug>(smartword-ge)
  " xmap w  <Plug>(smartword-w)
  " xmap b  <Plug>(smartword-b)
  " xmap e  <Plug>(smartword-e)
  " xmap ge  <Plug>(smartword-ge)
  map <S-W> <Plug>CamelCaseMotion_w
  map <S-B> <Plug>CamelCaseMotion_b
  map <S-E> <Plug>CamelCaseMotion_e

  nnoremap <Tab>    gt
  nnoremap <S-Tab>  gT
  nnoremap g1 1gt
  nnoremap g2 2gt
  nnoremap g3 3gt
  nnoremap g4 4gt
  nnoremap g5 5gt
  nnoremap g6 6gt
  nnoremap g7 7gt
  nnoremap g8 8gt
  nnoremap g9 9gt
  nnoremap g0 10gt

  " jump window
  if has('nvim') 
    noremap <silent> <C-k> <C-w><C-k>
    noremap <silent> <C-j> <C-w><C-j>
    noremap <silent> <C-l> <C-w><C-l>
    noremap <silent> <C-h> <C-w><C-h>
  else
    nnoremap <silent> <C-k> <C-w><C-k>
    nnoremap <silent> <C-j> <C-w><C-j>
    nnoremap <silent> <C-l> <C-w><C-l>
    nnoremap <silent> <C-h> <C-w><C-h>
    " noremap <silent> <C-k> :<C-u>winc k<CR>
    " noremap <silent> <C-j> :<C-u>winc j<CR>
    " noremap <silent> <C-l> :<C-u>winc l<Bar>mode<CR>
    " noremap <silent> <C-h> :<C-u>winc h<CR>
  endif

  " nmap <silent> <C-k> <Plug>scrollwinUp
  " nmap <silent> <C-j> <Plug>scrollwinDown
  " nmap <silent> <C-l> <Plug>scrollwinRight
  " nmap <silent> <C-h> <Plug>scrollwinLeft


  let g:tmux_navigator_no_mappings = 1

  " call submode#leave_with('layout', 'n', '', '<Esc>')
  " call submode#leave_with('layout', 'n', '', '<C-c>')
  for s:set in [
        \['n',      ':cal MoveToNextTab()<CR>'],
        \['p',      ':cal MoveToPrevTab()<CR>'],
        \['H',      ':winc H<CR>'],
        \['L',      ':winc L<CR>'],
        \['J',      ':winc J<CR>'],
        \['K',      ':winc K<CR>'],
        \['h',      ':cal WindowSwap#MarkWindowSwap()<Bar>winc h<Bar>cal WindowSwap#DoWindowSwap()<CR>'],
        \['l',      ':cal WindowSwap#MarkWindowSwap()<Bar>winc l<Bar>cal WindowSwap#DoWindowSwap()<CR>'],
        \['j',      ':cal WindowSwap#MarkWindowSwap()<Bar>winc j<Bar>cal WindowSwap#DoWindowSwap()<CR>'],
        \['k',      ':cal WindowSwap#MarkWindowSwap()<bar>winc k<bar>cal WindowSwap#DoWindowSwap()<cr>'],
        \['t', ':exe "tabm"tabpagenr()<CR>'],
        \['T', ':exe "tabm"tabpagenr()-2<CR>']]
    call submode#enter_with('layout', 'n', 's', '<C-w>'.s:set[0],        s:set[1].':cal lightline#update()<CR>')
    call submode#enter_with('layout', 'n', 's', '<C-w><C-'.s:set[0].'>', s:set[1].':cal lightline#update()<CR>')
    call        submode#map('layout', 'n', 's', s:set[0],                s:set[1])
    call        submode#map('layout', 'n', 's', '<C-'.s:set[0].'>',      s:set[1])
  endfor

  " ,MRU
  nnoremap <C-f> <Nop>
  " nnoremap <C-f>m     :Unite -winheight=10 -buffer-name=recent buffer file_mru<CR>
  " nnoremap <C-f><C-m> :Unite -winheight=10 -buffer-name=recent buffer file_mru<CR>

  nnoremap <C-f>m     :CtrlPMRUFiles<CR>
  nnoremap <C-f><C-m> :CtrlPMRUFiles<CR>
  " nnoremap <C-f>m     :Unite -winheight=10 -buffer-name=recent -unique -start-insert buffer neomru/file<CR>
  " nnoremap <C-f><C-m> :Unite -winheight=10 -buffer-name=recent -unique -start-insert buffer neomru/file<CR>

  " ,Bookmarks
  nmap <Space><Space> <Plug>BookmarkToggle
  nmap <Space>i <Plug>BookmarkAnnotate
  nmap <Space>a <Plug>BookmarkShowAll
  nmap <Space>j <Plug>BookmarkNext
  nmap <Space>k <Plug>BookmarkPrev

" #Git
nnoremap          <Leader>gg :Git<space>
nnoremap <silent> <Leader>gs :Gtabedit :<CR>
nnoremap <silent> <Leader>gd :call GdiffInTab()<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gb :NERDTreeClose<Bar>Gblame<CR>
" nnoremap <silent> <Leader>gv :Gitv<CR>
nnoremap <silent> <Leader>gv :GV<CR>
nnoremap <silent> <Leader>dp :diffput<CR>


" #Editing
let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" imap <expr><tab>
"   \ getline(line('.')) !~# '^\s*$' && getline(line('.'))[col('.')-1] != ' ' && !empty(UltiSnips#SnippetsInCurrentScope()) ? "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<cr>" :
"   \ emmet#isExpandable() ? "\<Plug>(emmet-expand-abbr)" :
"   \ "\<tab>"



nmap <leader>u :<C-u>UltiSnipsEdit<CR>

xnoremap <Leader>ree :Rextract<space>


xmap <C-j> <Plug>(vertical_move_down)
xmap <C-k> <Plug>(vertical_move_up)

vmap c <Plug>Commentary
vmap " <Plug>VSurround"
vmap ' <Plug>VSurround'
nmap d" <Plug>Dsurround"
nmap dt <Plug>Dsurroundt
nmap d' <Plug>Dsurround'
vmap v      <Plug>(expand_region_expand)
vmap <C-v>  <Plug>(expand_region_shrink)
call expand_region#custom_text_objects('ruby', { 'im' :0, 'am' :0, })
call expand_region#custom_text_objects({'iv':0, 'av':0, })
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

vnoremap <Leader>t, :Tabularize/,\zs<CR>
vnoremap <Leader>t: :Tabularize/:\zs<CR>
vnoremap <Leader>t= :Tabularize/=<CR>
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
nnoremap = ==
vnoremap <S-y> ygv

imap <C-h> <BS>
imap <C-h> <BS>

xmap <leader>n <Plug>NrrwrgnDo
nmap <leader>n <Plug>NrrwrgnDo

nmap <M-k> <Plug>(textmanip-move-up)==
nmap <M-j> <Plug>(textmanip-move-down)==
vmap <M-k> <Plug>(textmanip-move-up)==
vmap <M-j> <Plug>(textmanip-move-down)==

nmap <M-h> <Plug>(textmanip-move-left)
nmap <M-l> <Plug>(textmanip-move-right)
vmap <M-h> <Plug>(textmanip-move-left)
vmap <M-l> <Plug>(textmanip-move-right)

map <M-S-j> <Plug>(textmanip-duplicate-down)
map <M-S-k> <Plug>(textmanip-duplicate-up)
vmap <M-S-j> <Plug>(textmanip-duplicate-down)
vmap <M-S-k> <Plug>(textmanip-duplicate-up)

nnoremap <Leader>f<S-s> :%S/
vnoremap <Leader>f<S-s> :S/
nnoremap <silent> <Leader>fs :OverCommandLine<CR>%s/
vnoremap <silent> <Leader>fs :OverCommandLine<CR>s/

nmap <Leader>mc  :Unite -start-insert menu:conf<CR>
nmap <Leader>rrc :source $MYVIMRC<CR>
cabbrev trw :call TrimWhiteSpace()
nmap <silent> [shftf2] :call feedkeys(':Rename '.expand('%:t'), 'n')<CR>
let g:vcoolor_map = '<F4>'
" let g:vcool_ins_rgb_map = '<F4>'

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
cnoreabbrev qq q!
cnoreabbrev qqq qa!
cnoreabbrev q Q
cnoreabbrev qq Q!
cnoreabbrev m Make
" cnoreabbrev a A
" cnoreabbrev r R
cabbrev Tab Tabularize


command! -bang -nargs=0 Q call ExitFugitive('q<bang>')
cabbrev ga   Git add
cabbrev gcm  Git commit -m
cabbrev gcam Git commit --amend -m
cabbrev gco  Git checkout
cabbrev gcof Git checkout "%:p:h"

if has('nvim')
  tnoremap <Esc><Esc> <C-\><C-n>
endif

cabbrev plu NeoBundleUpdate
cabbrev pli NeoBundleCheck
cabbrev pls Unite neobundle/search


" imap <c-v> <plug>EasyClipInsertModePaste
" cmap <c-v> <plug>EasyClipCommandModePaste

" if has('gui_running')
"   inoremap <C-v> <C-r><C-o>*
"   cnoremap <C-v> <C-r><C-o>*
" else
"   inoremap <C-v> <C-r><C-o>0
"   " cnoremap <C-v> <C-r><C-o>0
"   augroup GuiPasteMappings
"     au!
"     au GUIEnter * inoremap <C-v> <C-r><C-o>* | cnoremap <C-v> <C-r><C-o>*
"   augroup END
" endif

nnoremap <silent> <Leader>rp :RainbowParenthesesToggle<CR>
nnoremap <silent> <Leader>fc :call ToggleFoldColumn()<CR>
nnoremap          <Leader>ig :IndentGuidesToggle<CR>
" nmap <leader>ig :IndentLinesToggle<CR>
nnoremap          <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>l     :lopen<CR>
nnoremap <Leader>c     :copen<CR>
nnoremap <Leader><S-c> :Copen<CR>

" #Misc
nnoremap j gj
nnoremap k gk
nnoremap <C-y> 2<C-y>
nnoremap <C-e> 2<C-e>
nnoremap z<S-e> <nop>
nnoremap <silent><C-w>o     :res<CR>
nnoremap <silent><C-w><C-o> :res<CR>
inoremap <silent><C-c> <Esc>
nnoremap <C-c> <Esc>
nnoremap <C-s> :write<CR>
nmap <S-u> :<C-u>redo<CR><Plug>(RepeatRedo)
" nnoremap <S-u> :redo<CR>
nnoremap ; :
vnoremap ; :
nnoremap <silent> <S-q> :call Quit()<CR>
noremap  <silent>  <C-q> :call CloseSomething()<CR>
nnoremap <silent> z<S-m> :call g:FoldEverything()<CR>

map ё `| map й q| map ц w| map у e| map к r| map е t| map н y| map г u| map ш i| map щ o| map з p| map х [| map ъ ]
map ф a| map ы s| map в d| map а f| map п g| map р h| map о j| map л k| map д l| map ж ;| map э '| map я z| map ч x
map с c| map м v| map и b| map т n| map ь m| map б ,| map ю .| map Ё ~| map Й Q| map Ц W| map У E| map К R| map Е T
map Н Y| map Г U| map Ш I| map Щ O| map З P| map Х {| map Ъ }| map Ф A| map Ы S| map В D| map А F| map П G| map Р H
map О J| map Л K| map Д L| map Ж :| map Э "| map Я Z| map Ч X| map С C| map М V| map И B| map Т N| map Ь M| map Б <
map Ю >


" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
" setlocal spell spelllang=ru_yo,en_us


let g:endwise_no_mappings = 1

" au VimEnter * call Aaaaa()

" fu! Aaaaa()
"   " exe "imap <C-X><CR> ".maparg('<CR>', 'i')."<Plug>AlwaysEnd"
"   exe "inoremap <CR> ".maparg('<CR>', 'i')."<Plug>DiscretionaryEnd"
" endfu
"
"
"
nmap gx <Plug>(openbrowser-open)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


nmap <F9> :Make! %<CR>
nmap <F6> :Make  %<CR>

augroup TmpWorkaroundWithEsearch
  au!
  au VimEnter * unmap <Leader>ff
augroup END

nmap <leader>rr <Plug>(quickrun)
