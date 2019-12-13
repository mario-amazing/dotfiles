set t_Co=256

fu! s:FixColors()
  if !exists('g:colors_name') | return | endif
  if 1 && g:colors_name =~ 'Tomorrow-Night-Eighties' 
    hi VertSplit    ctermbg=236
    hi Directory    cterm=bold
    hi Normal       ctermbg=8
    hi FoldColumn   ctermbg=8
  elseif g:colors_name =~ 'base16-eighties'
    hi clear SignColumn
    hi Directory        ctermfg=2 cterm=bold
    hi link NERDTreeOpenable Directory

    hi SignColumn   ctermbg=236
    " hi VertSplit    ctermbg=236 ctermfg=238
    hi VertSplit    ctermbg=236 ctermfg=236
    hi ColorColumn  ctermbg=237
    hi LineNr       ctermbg=236 ctermfg=240
    hi CursorLineNr ctermbg=236 ctermfg=240 cterm=bold
    hi CursorLine   ctermbg=237
    hi StatusLineNC ctermbg=238 ctermfg=7
    hi StatusLine   ctermbg=240 ctermfg=12
    hi Visual       ctermbg=239
    hi PMenu        ctermfg=250 ctermbg=239
    hi PmenuSel     cterm=reverse ctermfg=250 ctermbg=239
    hi PmenuSbar    ctermbg=248
    hi SpellBad     ctermbg=7   ctermfg=1
    hi Folded       ctermfg=245 ctermbg=235
    hi SyntasticErrorSign        ctermbg=236
    hi SyntasticWarningSign      ctermbg=236
    hi SyntasticStyleErrorSign   ctermbg=236
    hi SyntasticStyleWarningSign ctermbg=236

    hi MatchParen     cterm=bold ctermbg=240 ctermfg=none
    " hi Function       ctermfg=223
    " ctermfg=blue

    hi FoldColumn     ctermfg=14 ctermbg=236

    " hi DiffChange cterm=bold ctermfg=white ctermbg=4
    hi DiffChange cterm=none ctermfg=white ctermbg=239
    hi DiffText   cterm=bold ctermfg=white ctermbg=27

    hi DiffAdd      cterm=bold ctermbg=64  ctermfg=white
    " hi String ctermfg=144

    " hi Normal     ctermbg=235
    hi Constant ctermfg=229
    hi rubyConstant ctermfg=229
    hi rubyConstant ctermfg=222
    hi wildmenu     ctermfg=7 ctermbg=11
    hi StatusLine   cterm=reverse ctermfg=59 ctermbg=221
    hi StatusLineNC cterm=reverse ctermfg=59 ctermbg=251

    " au FileType html,eruby,slim hi htmlTagName  ctermfg=252
    " au FileType html,eruby,slim hi htmlArg      ctermfg=252

    " hi DiffDelete   cterm=bold ctermbg=9   ctermfg=white
    hi DiffDelete   cterm=bold ctermbg=203   ctermfg=white
    " hi DiffChange   cterm=bold ctermbg=178 ctermfg=white

    " hi DiffText     cterm=bold ctermbg=178 ctermfg=white
    hi clear Search
    hi clear IncSearch
    hi Search       ctermbg=241
    hi IncSearch       ctermbg=241
  elseif g:colors_name =~ 'base16-rails'
    hi clear SignColumn
    hi Directory    ctermfg=2 cterm=bold
    hi SignColumn   ctermbg=236
    hi VertSplit    ctermbg=236 ctermfg=238
    hi ColorColumn  ctermbg=237
    hi LineNr       ctermbg=236 ctermfg=240
    hi CursorLineNr ctermbg=236 ctermfg=240
    hi CursorLine   ctermbg=236
    hi StatusLineNC ctermbg=238 ctermfg=7
    hi StatusLine   ctermbg=240 ctermfg=12
    hi Visual       ctermbg=239
    hi PMenu        ctermfg=250 ctermbg=239
    "
    " hi PmenuSel     cterm=reverse ctermfg=250 ctermbg=239
    hi PmenuSel     cterm=reverse ctermfg=2

    hi PmenuSbar    ctermbg=248
    hi SpellBad     ctermbg=7   ctermfg=1
    hi Folded       ctermfg=245 ctermbg=235
    au ColorScheme * hi SyntasticErrorSign        ctermbg=236
    au ColorScheme * hi SyntasticWarningSign      ctermbg=236
    au ColorScheme * hi SyntasticStyleErrorSign   ctermbg=236
    au ColorScheme * hi SyntasticStyleWarningSign ctermbg=236
    hi MatchParen     ctermbg=none ctermfg=blue
  endif

  hi htmlBold cterm=bold
endfu

" au ColorScheme * hi SignColumn ctermbg=8
augroup SyntasticColors
  au ColorScheme * hi SyntasticErrorSign        ctermfg=203 ctermbg=8
  au ColorScheme * hi SyntasticWarningSign      ctermfg=227 ctermbg=8
  au ColorScheme * hi SyntasticStyleErrorSign   ctermfg=27  ctermbg=8
  au ColorScheme * hi SyntasticStyleWarningSign ctermfg=27  ctermbg=8
augroup END
hi WarnMsg       ctermfg=15 ctermbg=27 guifg=White guibg=Blue

" au ColorScheme * hi CleverFChar  cterm=bold ctermfg=196
au Colorscheme * hi Error           ctermbg=9   ctermfg=255     guibg=NONE     guifg=#AF5F5F

hi UrlBody cterm=underline ctermfg=39
" au ColorScheme * call <SID>FixColors()

colorscheme molokai
let g:molokai_original = 0
let g:rehash256 = 1
set background=dark
hi ESearchMatch ctermfg=black ctermbg=cyan guifg=#000000 guibg=#E6E6FA
hi EndOfBuffer ctermbg=0  ctermfg=0
hi ModeMsg     ctermbg=27 ctermfg=255


au ColorScheme * exe 'hi GitGutterChangeDelete ctermfg=39' .
      \ "ctermbg=".synIDattr(synIDtrans(hlID("StatusLineNC")), "bg", "cterm")

au VimEnter * redraw!
hi link uniteCandidateSourceName  Label
hi link uniteInputLine Normal

hi link uniteCandidateInputKeyword Identifier
hi link CtrlPMatch Identifier

" let g:easytags_python_enabled = 1

augroup collumnLimit
  autocmd!
  " au FileType vim,ruby,c,cpp,eruby,html  exe 'setlocal colorcolumn='.colLim
  " au VimEnter * hi ColorColumn cterm=bold ctermfg=161 ctermbg=none
  " au VimEnter * hi ColorColumn ctermbg=5
  au VimEnter * hi ColorColumn ctermbg=238
  " au VimEnter * hi ColorColumn ctermbg=160
  " au VimEnter * hi ColorColumn cterm=bold ctermbg=8
augroup END

hi link jsxTagName  Statement
hi link jsxCloseString  jsxTagName
hi link jsxTag  jsxTagName
hi link jsxAttrib Type

au BufEnter * match ColorColumn '\%80c.'
