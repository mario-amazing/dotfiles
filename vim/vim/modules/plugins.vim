" ,vCoolor
let g:vcoolor_disable_mappings = 1
let g:vcoolor_lowercase = 1
" let g:vcoolor_custom_picker = 'zenity --title "Vim colorsel" --color-selection --show-palette --color '
let g:vcoolor_custom_picker = 'yad --title "Vim colorsel" --color-selection --show-palette --color '


" ,instant
let g:instant_markdown_autostart = 0
" markdown
let g:vim_markdown_conceal = 1

let g:markdown_fenced_languages = ['sql']

" ,sideways
nnoremap <S-h> :SidewaysLeft<CR>
nnoremap <S-l> :SidewaysRight<CR>

" ,Bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_sign = ' '
let g:bookmark_annotation_sign = ' ﮉ'
let g:bookmark_show_toggle_warning = 0
let g:bookmark_center = 1


" Exchange
au VimEnter * hi ExchangeRegion cterm=bold ctermfg=7 ctermbg=240

" ,indexed-search
let  g:indexed_search_mappings = 0

" ,switch
let g:switch_mapping = '-'

" ,undoquit
nnoremap <c-w>c :call undoquit#SaveWindowQuitHistory()<cr><c-w>c
let g:windowswap_map_keys = 0

" ,Delimmate
let delimitMate_expand_space = 1

" ,Tagbar
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_autofocus = 1


" ,IndentLine
let g:indentLine_char = '⋮'   " another versions ┆│┊︙¦⋮⋮ ''
let g:indentLine_faster = 1
let g:indentLine_concealcursor = ''
nmap <leader>ig :IndentLinesToggle<CR>
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_enabled = 0
let g:indentLine_color_term = 12
let g:indentLine_fileType = ['html', 'eruby']
" let g:indentLine_conceallevel = 1
" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_leadingSpaceEnabled = 1

" pymode
let g:pymode_lint_ignore = ["E402", "E201","E202", "E701", "E731"]
let g:pymode_breakpoint_cmd = python_bp_line
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 180
let g:pymode_rope = 0
let g:pymode_doc = 0

" ,Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_c_compiler = "gcc"
let g:syntastic_c_compiler_options = "-Wall"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_ruby_checkers =  ['mri']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_signs = 1
let max_autocheck_lines = 300
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:max_err_len = 30


let g:syntastic_error_symbol   = ' ●'
let g:syntastic_warning_symbol = ' ●'
let g:syntastic_style_error_symbol   = ' ◉'
let g:syntastic_style_warning_symbol = ' ○'

" ,gitgutter
let g:gitgutter_sign_added =    ' ˖'
let g:gitgutter_sign_removed =  ' -'
let g:gitgutter_sign_modified = ' ▵'
let g:gitgutter_sign_modified_removed = ' ▵'

" ,OverCommandLine
let g:over_command_line_prompt = ':'




" ,emmet
let g:user_emmet_mode='iv'


" ,Vim-ruby
let ruby_operators = 1
let ruby_spellcheck_strings = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1
" let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_classes_in_global = 1


" ,rails
let g:rails_ctags_arguments = '-f tmp/tags'

" ,gitv
let g:Gitv_DoNotMapCtrlKey = 1


let g:EclimCompletionMethod = 'omnifunc'

let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'no'
" let tern_show_argument_hints = 1
set completeopt-=preview
let g:EasyClipAutoFormat = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1

" let g:tagbar_type_css = {
"       \ 'ctagstype' : 'Css',
"       \ 'kinds'     : [
"         \ 'c:classes',
"         \ 's:selectors',
"         \ 'i:identities'
"     \ ]
" \ }
let g:tagbar_type_ruby = {
      \ 'kinds': [
      \   'm:modules',
      \   'c:classes',
      \   'd:describes',
      \   'C:contexts', 
      \   'f:methods',
      \   'F:singleton methods',
      \   'r:resources',
      \ ]
      \ } 

let g:javascript_enable_domhtmlcss = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

let g:used_javascript_libs = 'jquery,angularjs,angularui'


autocmd FileType python syn keyword TODO contained TODO FIXME XXX NOTE contained containedin=pythoncomment
autocmd BufWritePost *.py silent! !ctags -R --python-kinds=-i --languages=python 2&gt; /dev/null &amp;
" autocmd BufNewFile,BufRead fugitive* setlocal bufhidden=delete
"

let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 0
let g:easytags_autorecurse = 1
let g:easytags_async = 0
let g:easytags_events = []
let g:easytags_file = 'tmp/tags'
let g:easytags_opts = ['--sort=yes', '--append=yes']


let g:submode_timeoutlen = 2500

let g:eregex_default_enable = 0
let g:incsearch#magic = '\v'

let g:gitgutter_eager = 0


if !exists('g:rails_gem_projections')
  let g:rails_gem_projections = {}
endif

if !exists('g:rails_projections')
  let g:rails_projections = {}
endif


let g:ruby_refactoring_map_keys = 0


let g:diminactive_use_colorcolumn = 0

let g:diminactive_use_syntax = 1
let g:tmuxcomplete#trigger = ''

" autoswap
let g:autoswap_detect_tmux = 1

" let g:vimpipe_invoke_map = '<leader>r'

let g:dbext_default_MYSQL_extra = '-t'

let g:quickrun_config = {'outputter/buffer/split': 'vertical'}
" let g:quickrun_config = {}
let g:quickrun_config.sql = {
      \ 'cmdopt': 'msw_dev'
      \}

let g:tabular_default_format = "l0"



let g:codi#width = 100
let g:codi#rightalign = 0


autocmd BufNewFile,BufRead *.docx.erb let b:eruby_subtype = 'html'
autocmd BufNewFile,BufRead .env.* set syntax=sh
" au BufReadPost *.docx.erb let b:eruby_subtype = 'html'


" tablemode
let g:table_mode_map_prefix = '<Leader>T'
let g:table_mode_realign_map = '<Leader>Tr'

" let g:atags_build_commands_list = [
"     \"ctags -R -f tags.tmp",
"     \"awk 'length($0) < 400' tags.tmp > tmp/tags",
"     \"rm tags.tmp"
"     \]

let g:filetype_tag_generate_commands = {
  \ 'ruby': "ripper-tags -R --exclude=vendor",
  \}
" let g:atags_build_commands_list = ["ripper-tags -R --exclude=vendor"]

function! s:err_handler(job_id, data, event_type)
  let msg = "? An error occurred generating ctags: " . join(a:data)
  echom msg
  let g:ctags_in_progress = 0
endfunction

function! s:exit_handler(job_id, data, event_type)
  echom "tags generated"
  let g:ctags_in_progress = 0
endfunction

let g:ctags_in_progress = 0
fu! RegenerateTags() abort
  if g:ctags_in_progress || &ft != 'ruby'
    return
  endif
  let g:ctags_in_progress = 1
  let argv = get(g:filetype_tag_generate_commands, &filetype, 'ctags .')

  let job_id = jobstart(argv, {
        \ 'on_stderr': function('s:err_handler'),
        \ 'on_exit': function('s:exit_handler'),
        \ })
  call jobclose(job_id, 'stdin')
endfu

autocmd BufWritePost * call RegenerateTags()

" 
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

"esearch
let g:esearch = { 'backend': 'nvim', 'adapters': {'rg': {'options': '--hidden'}}}
call   esearch#map('<C-f><C-f>','esearch')
call   esearch#map('<C-f>f',    'esearch')
call   esearch#map('<C-f>w',    'esearch-word-under-cursor')
call   esearch#map('<C-f><C-w>','esearch-word-under-cursor')

"   Keymap |     What it does
" ---------+---------------------------------------------------------------------------------------------
"    yf    | Yank a hovered file absolute path.
"    t     | Use a custom command to open the file in a tab.
"    +     | Render [count] more lines after a line with matches. Ex: + adds 1 line, 10+ adds 10.
"    -     | Render [count] less lines after a line with matches. Ex: - hides 1 line, 10- hides 10.
"    gq    | Populate QuickFix list using results of the current pattern search.
"    gsp   | Sort the results by path. NOTE that it's search util-specific.
"    gsd   | Sort the results by modification date. NOTE that it's search util-specific.

" Each definition contains nvim_set_keymap() args: [{modes}, {lhs}, {rhs}].
let g:esearch.win_map = [
 \ ['n', 'yf',  ':call setreg(esearch#util#clipboard_reg(), b:esearch.filename())<cr>'],
 \ ['n', 't',   ':call b:esearch.open("NewTabdrop")<cr>'                              ],
 \ ['n', '+',   ':call esearch#init(extend(b:esearch, AddAfter(+v:count1)))<cr>'      ],
 \ ['n', '-',   ':call esearch#init(extend(b:esearch, AddAfter(-v:count1)))<cr>'      ],
 \ ['n', 'gq',  ':call esearch#init(extend(copy(b:esearch), {"out": "qflist"}))<cr>'  ],
 \ ['n', 'gsp', ':call esearch#init(extend(b:esearch, sort_by_path))<cr>'             ],
 \ ['n', 'gsd', ':call esearch#init(extend(b:esearch, sort_by_date))<cr>'             ],
 \]

" Helpers to use in keymaps.
let g:sort_by_path = {'adapters': {'rg': {'options': '--sort path'}}}
let g:sort_by_date = {'adapters': {'rg': {'options': '--sort modified'}}}
" {'backend': 'system'} means synchronous reload using system() call to stay within the
" same context
let g:AddAfter = {n -> {'after': b:esearch.after + n, 'backend': 'system'}}


let g:livepreview_engine = 'pdflatex -interaction=nonstopmode '
let g:tex_flavor = 'latex'

" splitjoin
let g:splitjoin_ruby_trailing_comma = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
