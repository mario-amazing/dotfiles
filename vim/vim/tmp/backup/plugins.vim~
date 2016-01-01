" ,vCoolor
let g:vcoolor_disable_mappings = 1
let g:vcoolor_lowercase = 1
let g:vcoolor_custom_picker = 'zenity --title "Vim colorsel" --color-selection --show-palette --color '

" ,instantmarkdown
let g:instant_markdown_autostart = 0

" ,clever-f
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1

" ,sideways
nnoremap <S-h> :SidewaysLeft<CR>
nnoremap <S-l> :SidewaysRight<CR>
" ,Bookmarks
au BufLeave exe 'BookmarkSave ' .$HOME . '/.vim-bookmars'
let g:bookmark_auto_save = 0
" let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 0
let g:bookmark_auto_save_file = $HOME . '/.vim-bookmars'
call unite#custom#profile('source/vim_bookmarks', 'context', {
  \   'winheight': 13,
  \   'direction': 'botright',
  \   'start_insert': 1,
  \   'keep_focus': 0,
  \   'no_quit': 0,
  \ })

" ,notes
let g:notes_suffix = '.txt'
" Exchange
au VimEnter * hi ExchangeRegion cterm=bold ctermfg=7 ctermbg=240

" ,webdev icons
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_nerdtree = 0
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:webdevicons_enable_airline_tabline = 0
" let g:webdevicons_enable_airline_statusline = 0

" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Gemfile'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''

" let g:WebDevIconsUnicodeDecorateFolderNodes = 0
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''

" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '🗋'
" hi YellowFG ctermfg=3



" ,indexed-search
let  g:indexed_search_mappings = 0

" ,sitch
let g:switch_mapping = '-'

" ,undoquit
nnoremap <c-w>c :call undoquit#SaveWindowQuitHistory()<cr><c-w>c

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

" ,IndenGuides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
au VimEnter,Colorscheme * hi IndentGuidesOdd  ctermbg=237   guibg=gray
au VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=236 guibg=darkgray
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'qf']

" ,Notes
let g:notes_directories = ['~/Dropbox/Notes']


" ,IndentLine
" let g:indentLine_char = ''   " another versions ┆│┊︙¦⋮⋮
let g:indentLine_faster = 1
let g:indentLine_concealcursor = ''
" let g:indentLine_fileTypeExclude = ['nerdtree', 'help']
nmap <leader>ig :IndentLinesToggle<CR>
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_enabled = 0
let g:indentLine_color_term = 12
let g:indentLine_fileType = ['html', 'eruby']
" let g:indentLine_conceallevel = 1
" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_leadingSpaceEnabled = 1

" ,NERDTree
let g:NERDTreeHijackNetrw = 0
let NERDTreeMinimalUI=1

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

" let g:neomake_error_sign   = { 'text': ' ●', 'texthl': 'SyntasticErrorSign', }
" let g:neomake_warning_sign = { 'text': ' ●', 'texthl': 'SyntasticWarningSign', }
" let g:neomake_vim_enabled_makers = []
" ,gitgutter
" let g:gitgutter_sign_added = ' ➕'
" let g:gitgutter_sign_removed = ' ➖'
" let g:gitgutter_sign_modified = ' ∆'
" let g:gitgutter_sign_modified_removed = ' ≁'
let g:gitgutter_sign_added =    ' ˖'
let g:gitgutter_sign_removed =  ' -'
" let g:gitgutter_sign_modified = ' ∼'
" let g:gitgutter_sign_modified_removed = ' ≁'
let g:gitgutter_sign_modified = ' ∆'
let g:gitgutter_sign_modified_removed = ' ∆'

" ,OverCommandLine
let g:over_command_line_prompt = ':'




" ,emmet
let g:user_emmet_mode='iv'


" ,Matchtagalways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'eruby' : 1,
    \}

" ,Vim-ruby
let ruby_operators = 1
let ruby_spellcheck_strings = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1
let g:rubycomplete_classes_in_global = 1


" ,clang formatter
let g:clang_format#command = 'clang-format-3.6'
let g:clang_format#style_options = {
      \ "IndentWidth" : 4,
      \ "UseTab" : "Never",
      \ "BasedOnStyle" : "LLVM",
      \ "BreakBeforeBraces" : "Linux",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "AllowShortFunctionsOnASingleLine" : "false",
      \ "AllowShortIfStatementsOnASingleLine" : "false"
      \ }

" ,ultiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="horizontal"

" ,ctrlp
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|NERD_tree_2\|NERD_tree_3'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" E - jump to the window
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s -U -l --nocolor -g ""'
let g:ctrlp_root_markers = ['Gemfile', '.git', '.meteor', 'Rakefile', 'package.json', 'bower.json', 'index.html', 'main.c', 'main.cpp']

" let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_match_window = 'bottom,order:btt,min:9,max:10,results:30'


" ,fuzzyFinder
" nnoremap <silent> <C-p> :call fuf#givenfile#launch('', 0, '>>>', split(system('ag -l --nocolor -g ""'), "\n"))<CR>

" ,javascript
" ,vim-monster
"

" ,rails
let g:rails_ctags_arguments = '-f tmp/tags'

" ,gitv
let g:Gitv_DoNotMapCtrlKey = 1

" ,scratch
let g:scratch_no_mappings = 1

" #Highlight
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:textobj#quote#matchit = 1


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


" autocmd BufNewFile,BufRead fugitive* setlocal bufhidden=delete
"
let g:languagetool_jar = '/home/eugen/.vim/bundle/LanguageTool/LanguageTool-3.1/languagetool-commandline.jar'

let g:goog_user_conf = {
      \ 'langpair': 'en|ru',
      \ 'cmd': 'node',
      \ 'v_key': 'T'
      \ }


let g:switch_custom_definitions =
    \ [
    \   {
    \     '\<update_attribute\>': 'update_attributes',
    \     '\<update_attributes\>': 'update_attribute'
    \   }
    \ ]

let g:easytags_dynamic_files = 1
" let g:easytags_always_enabled = 1
let g:easytags_auto_highlight = 0
let g:easytags_autorecurse = 1
let g:easytags_async = 0

let g:easytags_events = []
let g:easytags_file = 'tmp/tags'
" let g:easytags_syntax_keyword = 'always'
"
let g:easytags_opts = ['--sort=yes', '--append=yes']
