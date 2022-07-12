" vim.api.nvim_exec([[
  augroup PluginFixes
    au!
    au FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
  augroup END


  augroup FiletypeAutocommands
    au!
    au FileType arduino setlocal commentstring=//%s

    au FileType git,GV setlocal nolist nowrap nonumber

    au FileType go setlocal nolist

    au FileType python setlocal ts=4 sw=4 sts=4
    au FileType Jenkinsfile setlocal ts=4 sw=4 sts=4
    au Filetype ruby setlocal expandtab ts=2 sw=2 sts=2 makeprg=ruby
    au FileType vimrc setlocal ts=2 sw=2 sts=2
    au Filetype html,css setlocal expandtab autoindent ts=2 sw=2 sts=2

    au BufEnter * let g:a = expand('%')
  augroup END


  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal cursorline
    au BufLeave,WinLeave * setlocal nocursorline
  augroup END
" ]], true)
