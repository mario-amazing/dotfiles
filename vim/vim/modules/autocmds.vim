if !has("autocmd")
  finish
endif
if &t_Co > 2 || has("gui_running") | syntax on | endif

augroup PluginFixes
  au!
  au FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
augroup END


augroup FiletypeAutocommands
  au!
  au FileType html,eruby,css,scss,sass setlocal iskeyword+=-
  au BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
  au BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
  au FileType cmake setlocal commentstring=#\ %s
  au FileType cfg setlocal commentstring=#\ %s
  au FileType arduino setlocal commentstring=//%s
  au FileType eruby.yaml setlocal commentstring=#\ %s

  au FileType slim let &commentstring = '/ %s'
  au FileType vhdl let &commentstring = '-- %s'

  au BufRead,BufNewFile *.vspec setlocal filetype=vim
  au BufRead,BufNewFile *.vspec nnoremap <buffer> <leader>rt :!vspec . %<CR>


  au BufRead,BufNewFile *.jbuilder setlocal ft=ruby

  au FileType git,GV setlocal nolist nowrap nonumber

  au FileType go setlocal nolist
  au FileType css,scss setlocal foldmethod=syntax
  au FileType python setlocal ts=4 sw=4 sts=4 foldmethod=indent
  au FileType Jenkinsfile setlocal ts=4 sw=4 sts=4 foldmethod=syntax

  au FileType coffee setlocal foldmethod=indent

  au BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
  au FileType vimrc setlocal foldmethod=syntax ts=2 sw=2 sts=2
  au Filetype c,cpp setlocal ts=4 sw=4 sts=4 cindent foldmethod=syntax
  au Filetype ruby setlocal expandtab ts=2 sw=2 sts=2  foldmethod=syntax makeprg=ruby
  au Filetype ruby let ruby_fold = 1
  au Filetype lex,yacc setlocal cindent ts=4 sw=4 sts=4
  au Filetype html,css setlocal expandtab foldmethod=syntax ts=2 sw=2 sts=2
  au Filetype html,css setlocal autoindent

  au Filetype eruby setlocal foldmethod=indent
  au Filetype ruby,eruby setlocal iskeyword-=.
  au Filetype eruby let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
  " Disable automatical wrap


  au FileType java setlocal omnifunc=javacomplete#Complete


  au FileType * setlocal conceallevel=0
  au FileType markdown setlocal conceallevel=2 

  au BufRead,BufNewFile *.slim set ft=slim


  au BufReadPre,BufNewFile *.jsx set conceallevel=0

  " t: Auto-wrap text using textwidth
  au FileType html,eruby,slim setlocal formatoptions-=t
  au BufNewFile,BufRead *.slim set iskeyword-=. foldmethod=indent
  au BufRead,BufNewFile *.scss set filetype=scss
  au FileType qf setlocal nolist

  au FileType make setlocal list listchars=tab:▷ ,trail:·
  au filetype qf nnoremap <buffer>o <CR>

  au BufEnter ControlP let g:a = 1  
  au BufLeave ControlP let g:a = 1  
  au BufEnter * let g:a = expand('%')
augroup END


augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal cursorline
  au BufLeave,WinLeave * setlocal nocursorline
augroup END
