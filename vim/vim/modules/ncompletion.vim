" finish
call deoplete#enable()
let g:deoplete#enable_at_startup = 1
" set completeopt+=noinsert
call deoplete#custom#option({'max_list': 20})
let g:deoplete#enable_ignore_case = 1
" let g:deoplete#max_list = 8

let g:necosyntax#min_keyword_length = 1
"
let g:deoplete#auto_completion_start_length = 0

augroup OmniFunctions
  au!
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
