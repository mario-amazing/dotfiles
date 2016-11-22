let g:neocomplete#enable_at_startup = 1
let g:neocomplete#data_directory = '~/.vim/tmp/cache/neocomplete'

let g:neocomplete#enable_ignore_case = 1

let g:neocomplete#enable_fuzzy_completion = 1

let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'

let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#omni#min_keyword_length = 3


" let g:monster#completion#rcodetools#backend = "async_rct_complete"
" let g:neocomplete#sources#omni#input_patterns = {
"       \ 'css': '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]'
"       \}
      " \ 'ruby': '[^. \t].\w|\h\w*::',

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" let g:neocomplete#force_omni_input_patterns.css = '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]'

" ,neocomplete


" let g:neocomplete#sources = {}
" let g:neocomplete#sources._ = ['rubymf', 'file', 'tag', 'file/include', 'dictionary', 'omni', 'syntax', 'member', 'buffer', 'ultisnips']
" let g:neocomplete#sources._ = ['buffer', 'member', 'tag', 'dictionary', 'file', 'omni']
" let g:neocomplete#sources.ruby = ['buffer', 'member', 'tag', 'dictionary', 'file', 'omni', 'UltiSnips']


" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" fu! s:my_cr_function()
"   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfu

let g:neocomplete#max_list = 8
" If the keyword length exceeds the length it will be not shown in popup menu.
let g:neocomplete#sources#buffer#max_keyword_width = 30


let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'css': "/home/eugen/.vim/bundle/vim-dict/dict/css.dic",
      \ 'ruby': "~/.vim/dict/ruby.dic",
\ }

augroup OmniFunctions
  au!
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END



" if !exists('g:neocomplete#sources')
"   let g:neocomplete#sources = {}
" endif
" let g:neocomplete#sources._ = ['buffer']
" let g:neocomplete#sources.cpp = ['buffer', 'dictionary']

