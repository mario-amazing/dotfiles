if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

set nocompatible
call plug#begin('~/.vim/bundle')

" #UI
Plug 'itchyny/lightline.vim'
Plug 'eugen0329/vim-hud'
" Plug 'vim-airline/vim-airline'
" Plug 'powerline/powerline'
" Plug 'ryanoasis/vim-webdevicons'

" #Navigation
  " ,tree
  Plug     'Shougo/unite.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  " Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'eugen0329/vim-nerdtree-smart-open'
  " Plug 'justinmk/vim-gtfo'
  " Plug 'voronkovich/ctrlp-nerdtree.vim'

  " ,code
  Plug 'majutsushi/tagbar' ", {'on':'TagbarToggle'}
  Plug 'mtscout6/vim-tagbar-css'
  Plug 'Shougo/unite-outline'
  Plug 'MaryHal/unite-unicode'
  " Plug 'tsukkee/unite-tag'
  " Plug 'rhysd/unite-ruby-require.vim'
  " Plug 'xolox/vim-easytags'
  Plug 'vim-scripts/ruby-matchit'
  Plug 'tmhedberg/matchit'

  if !has('nvim')
    Plug 'google/vim-maktaba'
    Plug 'google/vim-coverage'
    Plug 'google/vim-glaive'
  endif

  " ,search
  Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'ivalkeen/vim-ctrlp-tjump'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug 'iurifq/ctrlp-rails.vim'
  " Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'haya14busa/incsearch.vim'          " Incrementally highlight all pattern matches
  Plug 'haya14busa/incsearch-fuzzy.vim'    " Fuzzy search in 
  Plug 'haya14busa/vim-asterisk'           " *-improved
  Plug 'osyo-manga/vim-anzu'               " Search position info

  " Plug 'inside/vim-search-pulse'

  " ,motion
  Plug 'Lokaltog/vim-easymotion'           " highlight jumb target
  Plug 'rhysd/clever-f.vim'                " f{char} improved
  " Plug 'kana/vim-smartword'
  Plug 'bkad/CamelCaseMotion'

  Plug     'christoomey/vim-tmux-navigator'
  " Plug 't9md/vim-choosewin'            " easymotion-like choosing window
  Plug     'kopischke/vim-fetch'           " gf with lnum:col included

  " ,Project management
  " Plug 'derekwyatt/vim-protodef'
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'moll/vim-node'
  Plug 'artur-shaik/vim-javacomplete2'

  Plug 'mkomitee/vim-gf-python', { 'for': 'python' }
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
  Plug 'rafcamlet/show-me-db'
  " Plug 'basyura/unite-rails'
  " Plug 'moll/vim-node'
  Plug 'tpope/vim-projectionist'
  " Plug 'stefanoverna/vim-i18n'
  " Plug 'derekwyatt/vim-fswitch'

  " ,unused
  "
  " Plug 'othree/eregex.vim'
  " Plug 'tmux-plugins/vim-tmux-focus-events'
  " Plug 'mileszs/ack.vim'
  " Plug 'jszakmeister/vim-togglecursor'
  " Plug 'thinca/vim-qfreplace'
  " Plug 'lueyed/vim-qf_resize'
  " Plug 'nelstrom/vim-qargs'


" #Git
Plug     'tpope/vim-fugitive'
" Plug 'jreybert/vimagit'
" Plug 'gregsexton/gitv'
Plug 'junegunn/gv.vim'
Plug 'rhysd/conflict-marker.vim'
Plug     'tpope/vim-git'
Plug     'tommcdo/vim-fugitive-blame-ext'
Plug     'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'


Plug 'elixir-lang/vim-elixir'
Plug 'c-brenn/phoenix.vim'
" Plug 'avdgaag/vim-phoenix'
" Plug 'slashmili/alchemist.vm'
" #Ruby
Plug     'vim-ruby/vim-ruby'
Plug     'tpope/vim-rbenv'
Plug     'tpope/vim-rake'

Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'

Plug     'tpope/vim-bundler'
Plug 'xmisao/rubyjump.vim'
" Plug     'ecomba/vim-ruby-refactoring'
Plug     'sandeepravi/refactor-rails.vim'
" Plug     'p0deje/vim-ruby-interpolation'
" Plug     'rhysd/unite-ruby-require.vim'
" Plug     'tpope/vim-rvm'


" #Highlight
Plug 'digitaltoad/vim-pug'
Plug 'mxw/vim-jsx-improve'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug     'nathanaelkane/vim-indent-guides' " 'Yggdroot/indentLine'
" Plug     'Yggdroot/indentLine' " 'Yggdroot/indentLine'

" Plug 'kien/rainbow_parentheses.vim',  { 'on': ['RainbowParenthesesToggle'] }
" Plug 'gregsexton/MatchTag' ", {'autoload':{'for':['html', 'eruby', 'slim', 'css', 'sass', 'scss']}}
Plug 'Valloric/MatchTagAlways'

" Plug     'kshenoy/vim-signature'       " Set line marks
Plug 'MattesGroeger/vim-bookmarks'
" Plug 'jceb/vim-orgmode'

" #Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim' ", {'for': ['html', 'eruby', 'slim', 'css', 'sass', 'scss']}
" Plug 'vim-rails-snips'

" #Cmdline
Plug     'osyo-manga/vim-over'
Plug     'osyo-manga/vital-over'
Plug     'vim-scripts/cmdline-completion'
" Plug     'thinca/vim-prettyprint'
" Plug 'majkinetor/unite-cmdmatch', { 'depends':  'Shougo/unite.vim', 'mappings' : [['c', '<Plug>(unite_cmdmatch_complete)']] }
" Plug 'junegunn/vim-pseudocl'

" Textobjects
Plug 'terryma/vim-expand-region'     " Easier way to select textobjects
Plug 'kana/vim-textobj-user'         " User defined textobjects
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-line'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mattn/vim-textobj-url'
Plug 'glts/vim-textobj-comment'
Plug 'reedes/vim-textobj-quote'
Plug 'thinca/vim-textobj-between'
Plug 'lucapette/vim-textobj-underscore'
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
Plug 'kana/vim-smartinput'          " Automatic closing of quotes, parenthesis, brackets
Plug 'kana/vim-smartchr'          " Automatic closing of quotes, parenthesis, brackets
" Plug 'chrisbra/NrrwRgn'              " Edit selection in a newly created separate buffer
" Plug 'Raimondi/delimitMate'          " Automatic closing of quotes, parenthesis, brackets

" #Format
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'  }
Plug 'rhysd/vim-clang-format', {'on': 'ClangFormat' }
" Plug 'maksimr/vim-jsbeautify'

" #Note taking
" Plug 'xolox/vim-notes', { 'depends': 'xolox/vim-misc' }
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'


" #Languages support
  " ,backends
  if has('nvim')
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/context_filetype.vim'

    Plug 'zchee/deoplete-jedi'

    Plug 'Shougo/echodoc'
  else
    Plug 'Shougo/neocomplete.vim'
  endif
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neco-syntax'
  Plug 'ujihisa/neco-look'
  Plug 'vim-scripts/LanguageTool'
  Plug 'wellle/tmux-complete.vim'

  Plug 'hashivim/vim-terraform'
  " Plug 'Valloric/YouCompleteMe'

  " ,Intellisence completion
  Plug 'Shougo/neco-vim'                     " vimscript completion
  " Plug 'zchee/deoplete-clang'
  Plug 'carlitux/deoplete-ternjs'

  " Plug 'marijnh/tern_for_vim', {
  "       \ 'build' : {'linux': 'npm install'}}     " js completion
  " Plug 'myhere/vim-nodejs-complete'

  " Plug 'Rip-Rip/clang_complete'
  " Plug 'osyo-manga/vim-marching', { 'for': ['c', 'cpp']}  clang async completion
  Plug 'fatih/vim-go'
  " dictionaries
  Plug 'asins/vim-dict'
  Plug 'tracyone/dict'
  Plug 'guileen/vim-node-dict'

  Plug 'fatih/vim-go', { 'for' : ['go'] }
  Plug     'othree/html5.vim'
  Plug     'othree/csscomplete.vim'
  " Plug     'octol/vim-cpp-enhanced-highlight'
  Plug     'slim-template/vim-slim'
  Plug     'kchmck/vim-coffee-script'
  Plug     'cakebaker/scss-syntax.vim'
  Plug     'hail2u/vim-css3-syntax'
  Plug 'tmatilai/vim-monit'
  Plug 'chase/vim-ansible-yaml'

  Plug     'jelera/vim-javascript-syntax'
  Plug     'othree/javascript-libraries-syntax.vim'
  " Plug     'pangloss/vim-javascript'
  Plug 'justinmk/vim-syntax-extra', {'for': ['flex', 'lex', 'bison']}
  Plug 'munen/find_yaml_key'
  " Plug 'Einenlum/yaml-revealer'
  Plug     'lmeijvogel/vim-yaml-helper'

  Plug 'solarnz/thrift.vim'

" #Syntax
if has('nvim')
  Plug     'benekastah/neomake'
else
  Plug     'scrooloose/syntastic'
endif


" #Performance
if has('nvim')
  Plug 'itchyny/vim-parenmatch'
endif

" #Operating plugins
" Plug 'chrisbra/Recover.vim'
Plug 'Konfekt/FastFold' " Speed up Vim by updating folds only when called-for.
Plug 'sk1418/HowMuch' " A Vim plugin to calculate visual selected expressions
Plug 'tpope/vim-rsi'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jordwalke/VimCloser' " Make Vim close tabs the way every other editor does - by switching to the next tab to the left.
Plug 'tpope/vim-obsession'
" Plug 'kopischke/vim-stay' " Make Vim persist editing state without fuss
Plug     'kana/vim-submode'
Plug     'xolox/vim-misc'
Plug     'Shougo/vimproc.vim', { 'do': 'make' }
Plug     'Shougo/neomru.vim'         " Most recently used files/buffers
" Plug     'mtth/scratch.vim'          " qf-like window
Plug 'wesQ3/vim-windowswap'  " swap two windows
" Plug 'gioele/vim-autoswap'

Plug     'AndrewRadev/undoquit.vim'

Plug     'tpope/vim-eunuch'                " unix bash-like utils
Plug     'vim-scripts/LargeFile'
Plug     'tpope/vim-dispatch'
Plug     'radenling/vim-dispatch-neovim'

" Plug 'p0deje/vim-dispatch-vimshell'
Plug     'tpope/vim-scriptease'
Plug     'dyng/ctrlsf.vim'

" Plug 'vim-scripts/Hints-for-C-Library-Functions'
Plug     'AndrewRadev/linediff.vim'
" Plug 'chrisbra/vim-diff-enhanced'

" #Unused plugins
" Plug 'taq/vim-git-branch-info'
" Plug 'ervandew/supertab'
" Plug 'itchyny/thumbnail.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'Shougo/vimfiler.vim'
" Plug 'Shougo/vimshell.vim', { 'on': 'VimShell' }
" Plug 'milkypostman/vim-togglelist'
" Plug 'wesQ3/vim-windowswap'
" Plug     'skammer/vim-css-color' " 'gorodinskiy/vim-coloresque'
" Plug     'ap/vim-css-color'
" Plug     'chrisbra/unicode.vim'
" Plug     'greyblake/vim-preview'

" Plug     'Ioannis-Kapoulas/vim-autoprefixer'
Plug     'KabbAmine/vCoolor.vim'
" Plug 'atweiden/vim-betterdigraphs'
" Plug     'plasticboy/vim-markdown', { 'depends' : 'godlygeek/tabular'}

Plug 'shime/vim-livedown'
Plug     'tpope/vim-markdown'
Plug     'suan/vim-instant-markdown'  " Markdown live preview
" Plug     'jaxbot/browserlink.vim'       " live preview

" Plug 'kassio/neoterm'

" #Colors
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
" Plug 'Railscasts-Theme-GUIand256color'
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

Plug 'JarrodCTaylor/vim-js2coffee'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'mattn/googletranslate-vim'
" Plug 'maksimr/vim-translator'

" Plug 'kopischke/vim-stay'
" Plug 'tclem/vim-arduino'
Plug 'eugen0329/vim-esearch'         " Project-wide search
Plug 'kana/vim-vspec'         " Project-wide search
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
Plug 'vim-scripts/dbext.vim'

" Plug 'metakirby5/codi.vim'

Plug     'vim-scripts/vim-links'
" Plug 'thinca/vim-themis'         " Project-wide search
call plug#end()
filetype plugin indent on

