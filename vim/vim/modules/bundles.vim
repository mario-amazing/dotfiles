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
Plug 'tom-anders/telescope-vim-bookmarks.nvim' " bookmarks telescop visual
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
  au User Fugitive call plug#load('gv.vim', 'conflict-marker.vim', 'vim-gitgutter')
        \| au! load_git_plugins
  " NOTE au! -> clear group load_git_plugins, prevent multi loading
augroup END


" UI
"""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " highlight syntax


" Snippets
"""""""""""""""
" # TODO add snippets
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'slim', 'css', 'sass', 'scss']} " html tags expand div>h1


" #Cmdline
Plug 'osyo-manga/vim-over' " Visual substitute


" Textobjects
"""""""""""""""""""""""""""
Plug 'terryma/vim-expand-region'     " Easier way to select textobjects(vvv)


" Editing assistants
Plug 'mg979/vim-visual-multi', {'branch': 'master'}  " multi coursors

Plug 'AndrewRadev/switch.vim'        " Switch segments of text with predefined replacements(-)
Plug 'tpope/vim-abolish'             " Working with word Cases(crs/crm/cru)
Plug 'AndrewRadev/splitjoin.vim'     " Split/Join(gS/gJ)
Plug 'AndrewRadev/sideways.vim'      " Move an item in a delimiter-separated list left or right(S-h/S-l)
Plug 'tpope/vim-speeddating'         " CTRL-A/CTRL-X to increment dates, times, and more
Plug 'mroavi/vim-pasta'              " smart paste, override (p and p)!!!
Plug 'fedepujol/move.nvim'           " Move lines and blocks

Plug 'tpope/vim-commentary'          " Comment/uncomment code
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " treesitter context comments

Plug 'tpope/vim-surround'            " Manage code surroundings(quotes, parenthesis, brackets, *ml-tags etc.)
Plug 'machakann/vim-sandwich'        " Add #{} surround to ruby string

Plug 'godlygeek/tabular'             " Text align lines by regexp
Plug 'junegunn/vim-easy-align'       " Text align lines symbols(ga)
" TODO Add autopair with nvim-cmp


" Fuzzy menus
"""""""""""""""
Plug 'Shougo/neomru.vim'         " Most recently used files/buffers
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'MaryHal/unite-unicode'
Plug 'majutsushi/tagbar' ", {'on':'TagbarToggle'} (F2)


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
Plug 'kana/vim-submode'
Plug 'xolox/vim-misc'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'wesQ3/vim-windowswap'  " swap two windows
Plug 'AndrewRadev/undoquit.vim'
Plug 'tpope/vim-eunuch'                " unix bash-like utils
Plug 'vim-scripts/LargeFile'

Plug 'chrisbra/Colorizer' " show color by code

" Plug     'tpope/vim-dispatch'
" Plug     'radenling/vim-dispatch-neovim'
"
Plug 'christoomey/vim-tmux-navigator'
"    Plug 't9md/vim-choosewin'            " easymotion-like choosing window
Plug 'kopischke/vim-fetch'           " gf with lnum:col included
if has('nvim')
  Plug 'itchyny/vim-parenmatch'
endif

" Languages
"""""""""""""""
" #Syntax
Plug 'chr4/nginx.vim'

" lsp
Plug 'williamboman/nvim-lsp-installer' " autoinstall lsp clients
Plug 'neovim/nvim-lspconfig'

Plug 'deoplete-plugins/deoplete-jedi'

" python
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
"    ruby
Plug 'tpope/vim-bundler', { 'for': ['Gemfile', 'Rakefile', 'ruby'] }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'sandeepravi/refactor-rails.vim', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
"    markdown
Plug 'shime/vim-livedown' " Markdown live preview
Plug 'plasticboy/vim-markdown', { 'depends' : 'godlygeek/tabular'}
"    html
Plug 'othree/html5.vim'
"    css
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
"    latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"    slim
Plug 'slim-template/vim-slim'
"    javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'moll/vim-node'
"    yaml
Plug 'lmeijvogel/vim-yaml-helper'

"    Databases
"""""""""""""""""""""""
"    Plug 'vim-scripts/dbext.vim' " Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL, DBI,..)
Plug 'lifepillar/pgsql.vim'
Plug 'rafcamlet/show-me-db'

"    Dictionaries
"""""""""""""""
Plug 'asins/vim-dict'
Plug 'tracyone/dict'
Plug 'guileen/vim-node-dict'

"    Search
"""""""""""""""""""""""
Plug 'eugen0329/vim-esearch'         " Project-wide search
Plug 'eugen0329/vim-concertina'
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
