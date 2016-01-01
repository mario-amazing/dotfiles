
if &t_Co > 2 || has("gui_running") | syntax on | endif

augroup FiletypeAutocommands
  au!
  au FileType eruby,css,scss,sass setlocal iskeyword+=-
  au BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
  au BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
  au BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
  au FileType vimrc setlocal foldmethod=marker ts=2 sw=2 sts=2
  au Filetype c,cpp setlocal ts=4 sw=4 sts=4 cindent foldmethod=syntax
  au Filetype ruby setlocal expandtab ts=2 sw=2 sts=2  foldmethod=syntax
  au Filetype ruby let ruby_fold = 1
  au Filetype lex,yacc setlocal cindent ts=4 sw=4 sts=4
  au Filetype html,css setlocal expandtab foldmethod=syntax ts=2 sw=2 sts=2
  au Filetype html,css setlocal autoindent
  au Filetype ruby,eruby setlocal foldmethod=indent  iskeyword-=.
  au Filetype eruby let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
  " Disable automatical wrap
  au FileType html,eruby setlocal formatoptions-=t
  au BufNewFile,BufRead *.slim set iskeyword-=. foldmethod=indent
  au BufRead,BufNewFile *.scss set filetype=scss
  au FileType qf setlocal nolist
  au FileType notes setlocal foldmethod=indent
  au filetype qf nnoremap <buffer>o <CR>
  " au filetype ruby au BufWritePost <buffer> call GenerateCtags()
  au bufenter * call SetCtags()
augroup END

augroup UrlBodyHighlight
  au!
  " au BufEnter * let b:url_hl = matchadd('UrlBody', '\m\c\%(\%(h\?ttps\?\|ftp\|file\|ssh\|git\):\/\/\|[a-z]\+@[a-z]\+.[a-z]\+:\)
  "         \\%(\%([&:#*@~%_\-=?!+;/.0-9A-Za-z]*\%(\%([.,][&:#*@~%_\-=?!+;/0-9A-Za-z]\+\)\+\|\%(:\d\+\)\?\)\)\?
  "         \\%(([&:#*@~%_\-=?!+;/.0-9A-Za-z]*)\)\?
  "         \\%({\%([&:#*@~%_\-=?!+;/.0-9A-Za-z]*\|{[&:#*@~%_\-=?!+;/.0-9A-Za-z]*}\)}\)\?
  "         \\%(\[[&:#*@~%_\-=?!+;/.0-9A-Za-z]*\]\)\?\)*[-/0-9A-Za-z]*')
augroup END


augroup collumnLimit
  autocmd!
  au FileType vim,ruby,c,cpp,eruby,html  exe 'setlocal colorcolumn='.colLim
  au VimEnter * hi ColorColumn cterm=bold ctermfg=161 ctermbg=none
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal cursorline
  au BufLeave,WinLeave * setlocal nocursorline
augroup END

augroup InitAutocommands
  au!

  " au BufCreate * exe 'setlocal path=+'.expand('%:p:h')

  au BufDelete * let g:deleted_buffer = bufname('%')
  au BufEnter  * call KeepTree()
  au BufEnter *  if !exists('b:created') | call fugitive#detect(getcwd()) | endif
  au BufEnter *  let b:created = 1
  " au VimEnter  * if argc() == 0  | NERDTree | end
  au BufReadCmd  index{,.lock} xnoremap <buffer> <silent> d :<C-U>exe RemoveFugitiveIndexFiles(line("'<"),line("'>"))<CR>

  au WinEnter     * if &buftype == 'quickfix' && winheight(0) < 10 | resize 10 | endif
  au BufWinEnter,BufWritePost * let &numberwidth=(float2nr(log10(line('$'))) + 3)
  " Restore cursor position
  " au BufReadPost *
  "   \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "   \   exe "normal! g`\"" |
  "   \ endif
  if has('nvim')
    au BufWritePost * call CheckSyntax() | call lightline#update()
  else
    au BufWritePost * if line('$') < max_autocheck_lines |
          \ call CheckSyntax() |
          \ call lightline#update() |
          \ endif
  endif
augroup END

augroup ChangeCurosrShape
  au!
  if 0 && executable('gconftool-2')
    au InsertEnter * call system("gconftool-2 -s -t int /apps/guake/style/cursor_shape 1")
    au InsertLeave * call system("gconftool-2 -s -t int /apps/guake/style/cursor_shape 0")
    au WinLeave,FocusLost * call system("gconftool-2 -s -t int /apps/guake/style/cursor_shape 0")
    au VimEnter,WinEnter,BufWinEnter * if mode() == 'i' |
          \ call system("gconftool-2 -s -t int /apps/guake/style/cursor_shape 1") |
          \ else |
          \ call system("gconftool-2 -s -t int /apps/guake/style/cursor_shape 0") |
          \ endif
  endif
augroup END


augroup JavascriptFold
  au!
  " au FileType javascript call JavaScriptFold()
augroup END


" augroup NoSimultaneousEdit
"   au!
"   au SwapExists * let v:swapchoice = 'o'
"   au SwapExists * exe ' au VimEnter * echohl WarningMsg | echo "Duplicate edit session (readonly)" | echohl None'
" augroup END

" au BufWritePost * UpdateTags
"

" autocmd VimEnter *
"         \   call insert(g:dispatch_handlers, 'x11', 0)
