vim.api.nvim_exec([[
  augroup FiletypeAutocommands
    au!
    au BufWritePost * FormatWrite " formatter.nvim

    au FileType git,GV setlocal nolist nowrap nonumber

    au FileType Jenkinsfile setlocal ts=2 sw=2 sts=2
    au Filetype ruby setlocal expandtab ts=2 sw=2 sts=2 makeprg=ruby
    au FileType vimrc setlocal ts=2 sw=2 sts=2
    au Filetype html,css setlocal expandtab autoindent ts=2 sw=2 sts=2
  augroup END


  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal cursorline
    au BufLeave,WinLeave * setlocal nocursorline
  augroup END

  augroup vim-commentary
    au!
    autocmd FileType json setlocal commentstring=//\ %s
  augroup END
]], true)
