set nocompatible
call plug#begin('~/.vim/bundle')

" Colorschemes
"""""""""""""""
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

" #UI
Plug 'nvim-lualine/lualine.nvim'

" Tree
"""""""""""""""
Plug 'kyazdani42/nvim-tree.lua'

" Motion
"""""""""""
Plug 'ggandor/lightspeed.nvim' " easymotion(s/S) + f{char} improved
Plug 'bkad/CamelCaseMotion' " navigation inside word with different cases

" Telescop
"""""""""""""""
Plug 'nvim-lua/plenary.nvim' " requirement for telescope.nvim
Plug 'nvim-telescope/telescope.nvim'
Plug 'tami5/sqlite.lua' " requirement for telescope-frecency.nvim
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " fuzzy search
Plug 'kyazdani42/nvim-web-devicons'

" Git
"""""""""""""""
Plug 'tpope/vim-fugitive' " main git commands
Plug 'junegunn/gv.vim', {'on': []} " git commit helper
Plug 'rhysd/conflict-marker.vim', {'on': []}
Plug 'airblade/vim-gitgutter', {'on': []} " Add git line status(+/-/▵) to the left of a line

" optimization -> plugins loading, after nvim started
augroup load_git_plugins
  au!
  au User Fugitive call plug#load('gv.vim', 'conflict-marker.vim', 'vim-gitgutter') | au! load_git_plugins
augroup END


" UI
"""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Snippets
"""""""""""""""
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'slim', 'css', 'sass', 'scss']}


" #Cmdline
Plug     'osyo-manga/vim-over'
Plug     'osyo-manga/vital-over'
Plug     'vim-scripts/cmdline-completion'


" Textobjects
"""""""""""""""""""""""""""
" , {'on': '<Plug>(expand_region_expand)'}
Plug 'kana/vim-textobj-user'         " User defined textobjects
Plug 'terryma/vim-expand-region'     " Easier way to select textobjects(vvv)
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
Plug 'machakann/vim-sandwich'
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


" # Languages support

  " Plug     'octol/vim-cpp-enhanced-highlight'

" #Syntax
Plug 'chr4/nginx.vim'


" Fuzzy menus
"""""""""""""""
Plug     'Shougo/neomru.vim'         " Most recently used files/buffers
Plug  'Shougo/unite.vim'
Plug 'majutsushi/tagbar' ", {'on':'TagbarToggle'}
Plug 'Shougo/unite-outline'
Plug 'MaryHal/unite-unicode'


" Tools
"""""""""""""""
Plug 'MattesGroeger/vim-bookmarks'
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

Plug 'chrisbra/Colorizer' " show color by code

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
" lsp
Plug 'williamboman/nvim-lsp-installer' " autoinstall lsp clients
Plug 'neovim/nvim-lspconfig'

Plug 'deoplete-plugins/deoplete-jedi'

" python
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
" ruby
Plug 'tpope/vim-bundler', { 'for': ['Gemfile', 'Rakefile', 'ruby'] }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
" Plug 'vim-rails-snips'
Plug     'sandeepravi/refactor-rails.vim', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
" markdown
Plug 'shime/vim-livedown' " Markdown live preview
Plug 'plasticboy/vim-markdown', { 'depends' : 'godlygeek/tabular'}
" html
Plug     'othree/html5.vim'
" css
Plug     'cakebaker/scss-syntax.vim'
Plug     'hail2u/vim-css3-syntax'
" latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" slim
Plug     'slim-template/vim-slim'
" javascript
Plug     'jelera/vim-javascript-syntax'
Plug     'othree/javascript-libraries-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'moll/vim-node'
" yaml
Plug 'lmeijvogel/vim-yaml-helper'

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
Plug 'eugen0329/vim-concertina'
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
Plug 'Shougo/echodoc'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'
Plug 'vim-scripts/LanguageTool'
Plug 'Shougo/neco-vim'                     " vimscript completion
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/csscomplete.vim'

call plug#end()
filetype plugin indent on
