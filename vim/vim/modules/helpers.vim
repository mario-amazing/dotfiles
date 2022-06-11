fu! TrimWhiteSpace()
  %s/\s\+$//e
  %s/\n\{3,}/\r\r/e
  retab
endf

fu! GenerateCtags()
  if !RailsDetect()
    return ''
  endif

  call system("mkdir -p tmp")

  let path = 'tmp/tags'
  let tpath = filereadable(path) == 0 ? '-f ' . path : '-a ' . path

  call system('ripper-tags -R --tag-relative=yes  --append=yes --exclude=.git --exclude=log '.tpath .' *')
endfu
" au BufWritePost * if &ft ==# 'ruby' | call GenerateCtags() |endif
