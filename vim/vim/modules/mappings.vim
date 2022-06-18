" python
nnoremap yp :let @+ = tr(expand('%:r'), '/', '.')<CR>
nnoremap ypi :let @+ = "import " . tr(expand('%:r'), '/', '.')<CR>
nnoremap ypf :let @+ = "from " . tr(expand('%:r'), '/', '.') . " import "<CR>
