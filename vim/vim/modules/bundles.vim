call plug#begin('~/.vim/bundle')
Plug 'lewis6991/impatient.nvim' " cache startup lua plugins

" Colorschemes
"""""""""""""""
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'} " colorcheme

" #UI
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " highlight syntax
Plug 'nvim-lualine/lualine.nvim'
Plug 'goolord/alpha-nvim'       " startup window
Plug 'olimorris/persisted.nvim' " manage sessions
Plug 'kyazdani42/nvim-tree.lua'

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

" Git
"""""""""""""""
Plug 'kdheepak/lazygit.nvim' " UI for git
Plug 'tpope/vim-fugitive' " main git commands
Plug 'rhysd/conflict-marker.vim'
Plug 'lewis6991/gitsigns.nvim' " Add git line status(|/=/~) to the left of a line and Git diff

" Snippets
"""""""""""""""
" # TODO add snippets
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'slim', 'css', 'sass', 'scss']} " html tags expand div>h1

" Textobjects
"""""""""""""""""""""""""""
Plug 'terryma/vim-expand-region' " Easier way to select textobjects(vvv)
Plug 'wellle/targets.vim'        " Select inside({[]}) vi( va(
Plug 'andymass/vim-matchup'      " extends vim's % key
Plug 'osyo-manga/vim-over'       " Visual substitute

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Editing assistants
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

Plug 'junegunn/vim-easy-align'       " Text align lines symbols(ga)
Plug 'windwp/nvim-autopairs'
" !!!!!!TODO CHECK nvim-cmp complition!!!


" Tools
"""""""""""""""
Plug 'voldikss/vim-floaterm'
Plug 'kopischke/vim-fetch'         " gf with lnum:col included(:e test.rb:42,69)
Plug 'MattesGroeger/vim-bookmarks' " Bookmarks with space
Plug 'AndrewRadev/undoquit.vim'

Plug 'winston0410/cmd-parser.nvim' " requiremet for nvim-colorizer
Plug 'norcalli/nvim-colorizer.lua' " Shows color by code

" Languages
"""""""""""""""
Plug 'lyokha/vim-xkbswitch' " auto change language to en

" nginx
Plug 'chr4/nginx.vim'

" lsp
Plug 'neovim/nvim-lspconfig'

"    ruby
Plug 'tpope/vim-bundler', { 'for': ['Gemfile', 'Rakefile', 'ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rake'
"    markdown
Plug 'shime/vim-livedown' " Markdown live preview
"    html
" TODO add HTML ????
"    yaml
Plug 'lmeijvogel/vim-yaml-helper'

"    Search
"""""""""""""""""""""""
Plug 'eugen0329/vim-esearch'         " Project-wide search
Plug 'eugen0329/vim-concertina'
Plug 'haya14busa/vim-asterisk'           " *-improved

" Autocomplete
"""""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/neoinclude.vim' " for deoplete, It has file/include source and extends tag sources in neocomplete/deoplete/ncm.
Plug 'Shougo/neco-syntax' " for deoplete
Plug 'ujihisa/neco-look' " for deoplete
Plug 'Shougo/neco-vim'   " for deoplete
Plug 'carlitux/deoplete-ternjs' " for deoplete

call plug#end()
filetype plugin indent on
