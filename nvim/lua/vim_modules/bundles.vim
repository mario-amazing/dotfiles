call plug#begin('~/.config/nvim/bundle')
Plug 'lewis6991/impatient.nvim' " cache startup lua plugins

" Colorscheme
"""""""""""""""
Plug 'ellisonleao/gruvbox.nvim'

" #UI
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }  " highlight syntax
Plug 'nvim-treesitter/playground' " :TSPlaygroundToggle  treesitter information
Plug 'nvim-lualine/lualine.nvim'
Plug 'goolord/alpha-nvim'       " startup window
Plug 'olimorris/persisted.nvim' " manage sessions
Plug 'kyazdani42/nvim-tree.lua' " file manager

Plug 'ziontee113/icon-picker.nvim', { 'on': ['IconPickerInsert', 'IconPickerNormal', 'IconPickerYank'] }
Plug 'stevearc/dressing.nvim' " dependency for icon-picker.nvim

" Motion
"""""""""""
Plug 'ggandor/lightspeed.nvim' " easymotion(s/S) + f{char} improved
Plug 'bkad/CamelCaseMotion' " navigation inside word with different cases. Reverse alternative => https://github.com/chaoren/vim-wordmotion
Plug 'karb94/neoscroll.nvim' " smooth scroll zt, zz, zb, <C-u> <C-d> etc

" Telescop
"""""""""""""""
Plug 'nvim-lua/plenary.nvim' " requirement for telescope.nvim
Plug 'nvim-telescope/telescope.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim' " bookmarks telescop visual
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " fuzzy search
Plug 'kyazdani42/nvim-web-devicons'
" TODO think about add projects https://github.com/nvim-telescope/telescope-project.nvim or https://github.com/cljoly/telescope-repo.nvim

" Git
"""""""""""""""
Plug 'kdheepak/lazygit.nvim' " UI for git
Plug 'dinhhuy258/git.nvim' " main git commands
Plug 'rhysd/conflict-marker.vim'
Plug 'lewis6991/gitsigns.nvim' " Add git line status(|/=/~) to the left of a line and Git diff

" Textobjects
"""""""""""""""""""""""""""
Plug 'terryma/vim-expand-region' " Easier way to select textobjects(vvv)
Plug 'wellle/targets.vim'        " Select inside({[]}) vi( va( vi' va'
Plug 'andymass/vim-matchup'      " extends vim's % key
Plug 'osyo-manga/vim-over'       " Visual substitute
Plug 'windwp/nvim-ts-autotag'    " auto rename closing tags

" Editing assistants
Plug 'AndrewRadev/switch.vim'    " Switch segments of text with predefined replacements(-)
Plug 'tpope/vim-abolish'         " Working with word Cases(crs/crm/cru)
Plug 'AndrewRadev/splitjoin.vim' " Split/Join(gS/gJ)
Plug 'AndrewRadev/sideways.vim'  " Move an item in a delimiter-separated list left or right(S-h/S-l)
Plug 'tpope/vim-speeddating'     " CTRL-A/CTRL-X to increment dates, times, and more
Plug 'hrsh7th/nvim-pasta'        " smart paste, override (p and P)!!!
Plug 'fedepujol/move.nvim'       " Move lines and blocks

Plug 'kylechui/nvim-surround'    " Manage code surroundings(quotes, parenthesis, brackets, *ml-tags etc.)
Plug 'machakann/vim-sandwich'    " Add #{} surround to ruby string

Plug 'junegunn/vim-easy-align'   " Text align lines symbols(ga)
Plug 'windwp/nvim-autopairs'     " auto pair: { [ ( ' Auto adding end after blocks

Plug 'tpope/vim-commentary'      " Comment/uncomment code
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " treesitter context comments


" Tools
"""""""""""""""
Plug 'voldikss/vim-floaterm'
Plug 'kopischke/vim-fetch'         " gf with lnum:col included(:e test.rb:42,69)
Plug 'MattesGroeger/vim-bookmarks' " Bookmarks with space
Plug 'AndrewRadev/undoquit.vim'

Plug 'winston0410/cmd-parser.nvim' " requiremet for nvim-colorizer
Plug 'NvChad/nvim-colorizer.lua' " Shows color by code


" Indentation
Plug 'mhartington/formatter.nvim'
" Languages
"""""""""""""""
Plug 'lyokha/vim-xkbswitch' " auto change language to en

" nginx
Plug 'chr4/nginx.vim'

" lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' } " UI for lsp
Plug 'onsails/lspkind-nvim' " kind of autocomplite
Plug 'weilbith/nvim-code-action-menu', { 'on': 'CodeActionMenu' } " action float window

"    ruby
Plug 'tpope/vim-rbenv'  " improve nvim ruby loading
Plug 'tpope/vim-bundler', { 'for': ['Gemfile', 'Rakefile', 'ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rake'
"    markdown
Plug 'shime/vim-livedown', { 'on': 'LivedownToggle' } " Markdown live preview
"    yaml
Plug 'lmeijvogel/vim-yaml-helper' " substirute to https://github.com/cuducos/yaml.nvim after https://github.com/nvim-treesitter/nvim-treesitter/issues/1352

"    Search
"""""""""""""""""""""""
Plug 'eugen0329/vim-esearch'         " Project-wide search
Plug 'eugen0329/vim-concertina'
Plug 'haya14busa/vim-asterisk'       " *-improved

" Autocomplete
"""""""""""""""""""
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'lukas-reineke/cmp-rg'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'saadparwaiz1/cmp_luasnip'
" Snippets
"""""""""""""""
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets' " snippets collection
Plug 'mattn/emmet-vim'        " html tags expand div>h1

" Tags
Plug 'ludovicchabant/vim-gutentags'

call plug#end()
filetype plugin indent on
