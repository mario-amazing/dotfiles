" https://github.com/gruvbox-material/vim
" :help gruvbox-material-configuration
set termguicolors
" let g:gruvbox_material_palette = 'original'
" let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

" gruvbox fix CtrlP search color
function! s:HL(group, fg, bg, ...)
  let hl_string = [
        \ 'highlight', a:group,
        \ 'guifg=' . a:fg[0],
        \ 'guibg=' . a:bg[0],
        \ ]
  if a:0 >= 1
    if a:1 ==# 'undercurl'
      call add(hl_string, 'gui=undercurl')
      call add(hl_string, 'cterm=underline')
    else
      call add(hl_string, 'gui=' . a:1)
      call add(hl_string, 'cterm=' . a:1)
    endif
  else
    call add(hl_string, 'gui=NONE')
    call add(hl_string, 'cterm=NONE')
  endif
  if a:0 >= 2
    call add(hl_string, 'guisp=' . a:2[0])
  endif
  execute join(hl_string, ' ')
endfunction

" #FFA600
call s:HL('CtrlPMatch', ['#d8910d', '142', 'Yellow'], ['NONE', 'NONE', 'NONE'], 'bold')
