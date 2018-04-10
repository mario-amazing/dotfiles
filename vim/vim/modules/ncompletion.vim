let g:deoplete#enable_at_startup = 1
" set completeopt+=noinsert
let deoplete#max_list = 20
let g:deoplete#enable_ignore_case = 1
" let g:deoplete#max_list = 8

" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']


" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['file', 'tag', 'file/include', 'dictionary', 'omni', 'syntax', 'member', 'buffer', 'ultisnips', 'vim']
" let g:deoplete#sources._ = ['file', 'file/include', 'dictionary', 'omni', 'syntax', 'member', 'buffer', 'ultisnips', 'vim']
" let g:deoplete#sources['scss.css'] = ['omni']
" let g:deoplete#sources._ = ['file/include']
" let g:deoplete#sources.ruby = ['file', 'tag', 'file/include', 'dictionary', 'omni', 'syntax', 'member', 'buffer', 'ultisnips', 'vim']
" let g:neocomplete#sources._ = ['file', 'tag', 'file/include', 'dictionary', 'omni', 'syntax', 'member', 'buffer', 'ultisnips']
let g:necosyntax#min_keyword_length = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" let g:neoinclude#patterns = {}
" let g:neoinclude#patterns.ruby = '^=\%(b\%[egin]\|e\%[nd]\)\|\%(@@\|[$@]\)\h\w*\|\h\w*\%(::\w*\)*[!?]\?'

" let g:deoplete#omni#input_patterns = {
"   \ 'ruby': '[^. \t].\w|\h\w*::',
"   \ }
  " \ 'css': '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]',
  " \ 'scss': '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]',
  " \ 'css': '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]',
  " \ 'scss.css': '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]'
augroup OmniFunctions
  au!
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END


" if !exists('g:neoinclude#exts')
"   let g:neoinclude#exts = {}
" endif
" let g:neoinclude#exts.html = ['html']
"
let g:deoplete#enable_refresh_always = 1


call deoplete#custom#source('-', 'matchers', ['matcher_length', 'matcher_full_fuzzy'])

call deoplete#custom#source('ultisnips', 'rank', 10001)
call deoplete#custom#source('file_include', 'rank', 10000)
call deoplete#custom#source('file', 'rank', 9999)
call deoplete#custom#source('omni', 'rank', 9998)
call deoplete#custom#source('vim', 'rank', 9997)
call deoplete#custom#source('member', 'rank', 9996)
call deoplete#custom#source('syntax', 'rank', 9995)
call deoplete#custom#source('tag', 'rank', 9994)
call deoplete#custom#source('buffer', 'rank', 9993)
call deoplete#custom#source('dictionary', 'rank', 9992)
call deoplete#custom#source('tmux', 'rank', 9991)
call deoplete#custom#source('look', 'rank', 9990)

