if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

set nocompatible
call plug#begin('~/.vim/bundle')

" #UI
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'powerline/powerline'
" Plug 'ryanoasis/vim-webdevicons'

" tree
"""""""""""""""
Plug 'scrooloose/nerdtree',               { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind', 'NERDTreeClose'] }
Plug 'jistr/vim-nerdtree-tabs',           { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind', 'NERDTreeClose'] }
Plug 'eugen0329/vim-nerdtree-smart-open', { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind', 'NERDTreeClose'] }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'justinmk/vim-gtfo'
" Plug 'voronkovich/ctrlp-nerdtree.vim'

if !has('nvim')
  " Plug 'google/vim-maktaba'
  " Plug 'google/vim-coverage'
  " Plug 'google/vim-glaive'
endif

" Motion
"""""""""""
Plug 'Lokaltog/vim-easymotion', {'on': []}           " highlight jumb target
augroup load_em
  au!
  au CursorMoved call plug#load(vim-easymotion)
        \| au! load_em
augroup END

Plug 'rhysd/clever-f.vim'                " f{char} improved
" Plug 'kana/vim-smartword'
Plug 'bkad/CamelCaseMotion'

" Git
"""""""""""""""
Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim', {'on': []}
Plug 'rhysd/conflict-marker.vim', {'on': []}
Plug 'tpope/vim-git', {'on': []}
Plug 'tommcdo/vim-fugitive-blame-ext', {'on': []}
Plug 'airblade/vim-gitgutter', {'on': []}

augroup load_git_plugins
  au!
  au User Fugitive call plug#load('gv.vim', 'conflict-marker.vim', 'vim-git', 'vim-fugitive-blame-ext', 'vim-gitgutter')
        \| au! load_git_plugins
augroup END


" UI
"""""""""""""""""""
Plug     'nathanaelkane/vim-indent-guides' " 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways', { 'for': ['erb', 'html', 'xml'] }


" Snippets
"""""""""""""""


Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'slim', 'css', 'sass', 'scss']}

" #Cmdline
Plug     'osyo-manga/vim-over'
Plug     'osyo-manga/vital-over'
Plug     'vim-scripts/cmdline-completion'
" Plug     'thinca/vim-prettyprint'
" Plug 'majkinetor/unite-cmdmatch', { 'depends':  'Shougo/unite.vim', 'mappings' : [['c', '<Plug>(unite_cmdmatch_complete)']] }
" Plug 'junegunn/vim-pseudocl'

" Textobjects
"""""""""""""""""""""""""""
" , {'on': '<Plug>(expand_region_expand)'}
Plug 'kana/vim-textobj-user'         " User defined textobjects
Plug 'terryma/vim-expand-region'     " Easier way to select textobjects
Plug 'whatyouhide/vim-textobj-xmlattr', { 'for': ['html', 'xml'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'kana/vim-textobj-line'
Plug 'mattn/vim-textobj-url'
Plug 'glts/vim-textobj-comment'
Plug 'reedes/vim-textobj-quote'
Plug 'thinca/vim-textobj-between'
" Plug 'lucapette/vim-textobj-underscore'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'kana/vim-textobj-entire'

" #Editing assistants
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-utils/vim-vertical-move'   " Move 'up' or 'down' without changing the cursor column. Cursor *always* stays in the same column.
Plug 'tpope/vim-abolish'             " Working with word cases
Plug 'tpope/vim-commentary'          " Comment/uncomment code
Plug 'tpope/vim-surround'            " Manage code surroundings(quotes, parenthesis, brackets, *ml-tags etc.)
Plug 'tpope/vim-speeddating'         " CTRL-A/CTRL-X to increment dates, times, and more
Plug 'sickill/vim-pasta'             " Smart paste
" Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'        " Switch segments of text with predefined replacements
Plug 'AndrewRadev/sideways.vim'      " Move an item in a delimiter-separated list left or right
Plug 'godlygeek/tabular'             " Text align by regexp
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-exchange'          " Swap two pieces of code
Plug 't9md/vim-textmanip'            " Drag visual text blocks
" Plug 'tpope/vim-endwise'             " Automatic closing code blocks
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'kana/vim-smartinput' , { 'on': [] }         " Automatic closing of quotes, parenthesis, brackets
Plug 'kana/vim-smartchr'          " Automatic closing of quotes, parenthesis, brackets
" Plug 'chrisbra/NrrwRgn'              " Edit selection in a newly created separate buffer
" Plug 'Raimondi/delimitMate'          " Automatic closing of quotes, parenthesis, brackets

" #Format
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'  }
Plug 'rhysd/vim-clang-format', {'on': 'ClangFormat' }
" Plug 'maksimr/vim-jsbeautify'

" #Note taking
" Plug 'xolox/vim-notes', { 'depends': 'xolox/vim-misc' }
" Plug 'vim-scripts/utl.vim'


" # Languages support


  " Plug     'octol/vim-cpp-enhanced-highlight'

" #Syntax
if has('nvim')
  " Plug     'benekastah/neomake'
else
  " Plug     'scrooloose/syntastic'
endif



" Fuzzy menus
"""""""""""""""
Plug     'Shougo/neomru.vim'         " Most recently used files/buffers
Plug  'Shougo/unite.vim'
Plug 'majutsushi/tagbar' ", {'on':'TagbarToggle'}
Plug 'Shougo/unite-outline'
Plug 'MaryHal/unite-unicode'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Tools
"""""""""""""""
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jgdavey/tslime.vim' " Send command from vim to a running tmux session
Plug 'tpope/vim-projectionist'
Plug 'AndrewRadev/linediff.vim'
Plug 'eugen0329/vim-hud'
Plug 'KabbAmine/vCoolor.vim'
Plug 'Konfekt/FastFold' " Speed up Vim by updating folds only when called-for.
" Plug 'sk1418/HowMuch' " A Vim plugin to calculate visual selected expressions
Plug 'tpope/vim-rsi'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnable'}
Plug 'jordwalke/VimCloser' " Make Vim close tabs the way every other editor does - by switching to the next tab to the left.
Plug 'tpope/vim-obsession'
Plug     'kana/vim-submode'
Plug     'xolox/vim-misc'
Plug     'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'wesQ3/vim-windowswap'  " swap two windows
Plug     'AndrewRadev/undoquit.vim'
Plug     'tpope/vim-eunuch'                " unix bash-like utils
Plug     'vim-scripts/LargeFile'

" Plug     'tpope/vim-dispatch'
" Plug     'radenling/vim-dispatch-neovim'
"
Plug     'christoomey/vim-tmux-navigator'
" Plug 't9md/vim-choosewin'            " easymotion-like choosing window
Plug     'kopischke/vim-fetch'           " gf with lnum:col included
if has('nvim')
  Plug 'itchyny/vim-parenmatch'
endif

" Languages
"""""""""""""""
" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'c-brenn/phoenix.vim'
" Plug 'avdgaag/vim-phoenix'
" Plug 'slashmili/alchemist.vm'
" python
Plug 'mkomitee/vim-gf-python', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
" ruby
Plug 'tpope/vim-bundler', { 'for': ['Gemfile', 'Rakefile', 'ruby'] }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'vim-rails-snips'
Plug     'sandeepravi/refactor-rails.vim', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
Plug 'xmisao/rubyjump.vim', { 'for': 'ruby' } " Quick jump to method, class, module defenitions in buffers
" markdown
Plug 'shime/vim-livedown' " Markdown live preview
Plug 'plasticboy/vim-markdown', { 'depends' : 'godlygeek/tabular'}
" org
Plug 'jceb/vim-orgmode'
" go
Plug 'fatih/vim-go', { 'for' : ['go'] }
" html
Plug     'othree/html5.vim'
" css
Plug     'cakebaker/scss-syntax.vim'
Plug     'hail2u/vim-css3-syntax'
" R-lang
Plug 'jalvesaq/Nvim-R'
" viml
Plug 'tpope/vim-scriptease'
Plug 'kana/vim-vspec'         " Project-wide search
" terraform
Plug 'hashivim/vim-terraform'
" latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" slim
Plug     'slim-template/vim-slim'
"coffeescript
Plug     'kchmck/vim-coffee-script'
Plug 'JarrodCTaylor/vim-js2coffee'
" monit
Plug 'tmatilai/vim-monit'
" javascript
Plug     'jelera/vim-javascript-syntax'
Plug     'othree/javascript-libraries-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'mxw/vim-jsx-improve'
Plug 'moll/vim-node'
" yaml, ansible
Plug 'chase/vim-ansible-yaml'
Plug 'munen/find_yaml_key'
Plug 'lmeijvogel/vim-yaml-helper'
" flex/bison
Plug 'justinmk/vim-syntax-extra', {'for': ['flex', 'lex', 'bison']}
" thrift
Plug 'solarnz/thrift.vim'

" Databases
"""""""""""""""""""""""
" Plug 'vim-scripts/dbext.vim' " Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL, DBI,..)
Plug 'lifepillar/pgsql.vim'
Plug 'rafcamlet/show-me-db'

" Dictionaries
"""""""""""""""
Plug 'asins/vim-dict'
Plug 'tracyone/dict'
Plug 'guileen/vim-node-dict'

" Search
"""""""""""""""""""""""
Plug 'eugen0329/vim-esearch'         " Project-wide search
Plug 'haya14busa/incsearch.vim'          " Incrementally highlight all pattern matches
Plug 'haya14busa/incsearch-fuzzy.vim'    " Fuzzy search in 
Plug 'haya14busa/vim-asterisk'           " *-improved
Plug 'osyo-manga/vim-anzu'               " Search position info

" Autocomplete
"""""""""""""""""""
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/context_filetype.vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/echodoc'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'
Plug 'vim-scripts/LanguageTool'
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/neco-vim'                     " vimscript completion
Plug 'carlitux/deoplete-ternjs'
Plug     'othree/csscomplete.vim'

" Colorschemes
"""""""""""""""
Plug 'joshdick/onedark.vim'

" Plug 'KabbAmine/yowish.vim'
" Plug     'jonathanfilip/vim-lucius'
" Plug 'voronianski/oceanic-next-color-scheme'
" Plug 'vim-scripts/lilypink'
" Plug     'gmoe/vim-espresso'
" Plug 'zeis/vim-kolor'
" Plug 'nanotech/jellybeans.vim'
Plug 'flazz/vim-colorschemes'
Plug 'wesgibbs/vim-irblack'
" Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/xterm-color-table.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jdkanani/vim-material-theme'
" Plug 'jordwalke/VimCleanColors'
" Plug 'cschlueter/vim-wombat'
" Plug 'vim-scripts/Mustang2'
" Plug 'croaker/mustang-vim'
" Plug 'desertink.vim'
" Plug 'joedicastro/vim-molokai256'
Plug 'jordwalke/flatlandia'
" Plug 'vivkin/flatland.vim'
" Plug 'abra/vim-abra'
" Plug 'ajh17/Spacegray.vim'
" Plug 'cdmedia/itg_flat_vim'
" Plug 'chriskempson/base16-vim'
" Plug 'desert-warm-256'
" Plug 'edkolev/tmuxline.vim'
" Plug 'gosukiwi/vim-atom-dark'
" Plug 'mbbill/desertEx'
" Plug 'trusktr/seti.vim'

" Plug 'thinca/vim-ref'
" Plug 'lucapette/vim-ruby-doc'
" Plug 'tyru/open-browser.vim'
" Plug 'ap/vim-css-color'
" Plug 'lornix/vim-scrollbar'
" Plug 'severin-lemaignan/vim-minimap'

" Plug 'maksimr/vim-jsbeautify'
" Plug 'mattn/googletranslate-vim'
" Plug 'maksimr/vim-translator'

" Plug 'kopischke/vim-stay'
" Plug 'tclem/vim-arduino'
Plug 'gcavallanti/vim-noscrollbar'         " Project-wide search
" Plug 'vim-scrollbar-win'         " Project-wide search
" Plug 'junegunn/vim-oblique'         " Project-wide search
" Plug 'junegunn/vim-pseudocl'
" Plug 'blueyed/vim-diminactive'         " Project-wide search



" Plug 'lambdalisue/vim-diffa'
" Plug 'lambdalisue/vim-gita'
" Plug 'lambdalisue/gina.vim'
" https://github.com/NLKNguyen/pipe-mysql.vim
" Plug     'thinca/vim-quickrun'
" Plug 'krisajenkins/vim-pipe'

" Plug 'metakirby5/codi.vim'

Plug     'vim-scripts/vim-links'
Plug 'prabirshrestha/async.vim'
" Plug 'gorkunov/smartgf.vim'
" Plug 'jsfaint/gen_tags.vim'
" Plug 'thinca/vim-themis'         " Project-wide search
call plug#end()
filetype plugin indent on

