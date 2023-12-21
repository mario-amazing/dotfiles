local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup( {
  -- Colorscheme
  ------------------------------
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },

  -- #UI
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },  -- highlight syntax
  { "nvim-treesitter/playground" }, -- :TSPlaygroundToggle  treesitter information
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons'} },
  { 'goolord/alpha-nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } }, -- startup window
  { "olimorris/persisted.nvim", config = true }, -- manage sessions
  { "kyazdani42/nvim-tree.lua" }, -- file manager

  { "ziontee113/icon-picker.nvim", dependencies = { "stevearc/dressing.nvim" }, cmd = {"IconPickerInsert", "IconPickerNormal", "IconPickerYank"} },

  -- Motion
  ----------------------
  { "ggandor/lightspeed.nvim" }, -- easymotion(s/S) + f{char} improved
  { "bkad/CamelCaseMotion" }, -- navigation inside word with different cases. Reverse alternative => https://github.com/chaoren/vim-wordmotion
  { "karb94/neoscroll.nvim" }, -- smooth scroll zt, zz, zb, <C-u> <C-d> etc

  -- Telescop
  ------------------------------
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } }, -- bookmarks telescop visual
  { 'tom-anders/telescope-vim-bookmarks.nvim' }, -- bookmarks telescop visual
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- fuzzy search
  { 'nvim-tree/nvim-web-devicons' },
  -- TODO think about add projects https://github.com/nvim-telescope/telescope-project.nvim or https://github.com/cljoly/telescope-repo.nvim

  -- Git
  ------------------------------
  { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "dinhhuy258/git.nvim" }, -- main git commands
  { "rhysd/conflict-marker.vim" },
  { "lewis6991/gitsigns.nvim" }, -- Add git line status(|/=/~) to the left of a line and Git diff


  -- Textobjects
  ------------------------------------------------------
  { "terryma/vim-expand-region" }, -- Easier way to select textobjects(vvv)
  { "wellle/targets.vim" },        -- Select inside({[]}) vi( va( vi" va"
  { "andymass/vim-matchup"},       -- extends vim"s % key
  { "osyo-manga/vim-over" },       -- Visual substitute
  { "windwp/nvim-ts-autotag" },    -- auto rename closing tags

  -- Editing assistants
  { "AndrewRadev/switch.vim" },    -- Switch segments of text with predefined replacements(-)
  { "tpope/vim-abolish" },         -- Working with word Cases(crs/crm/cru)
  { "AndrewRadev/splitjoin.vim" }, -- Split/Join(gS/gJ)
  { "Wansmer/sibling-swap.nvim", dependencies = { 'nvim-treesitter' } }, -- Move an item in a delimiter-separated list left or right(S-h/S-l)
  { "Wansmer/treesj", dependencies = { 'nvim-treesitter/nvim-treesitter' } },            -- Main Split/Join -> fallback to splitjoin.vim
  { "tpope/vim-speeddating" },     -- CTRL-A/CTRL-X to increment dates, times, and more
  { "hrsh7th/nvim-pasta" },        -- smart paste, override (p and P)!!!
  { "fedepujol/move.nvim" },       -- Move lines and blocks

  { "kylechui/nvim-surround", version = "*", event = "VeryLazy" }, -- Manage code surroundings(quotes, parenthesis, brackets, *ml-tags etc.)
  { "machakann/vim-sandwich" },    -- Add #{} surround to ruby string

  { "junegunn/vim-easy-align" },   -- Text align lines symbols(ga)
  { 'windwp/nvim-autopairs', event = "InsertEnter" }, -- auto pair: { [ ( " Auto adding end after blocks

  { "tpope/vim-commentary" },      -- Comment/uncomment code
  { "JoosepAlviste/nvim-ts-context-commentstring" }, -- treesitter context comments


  -- Tools
  ------------------------------
  { "voldikss/vim-floaterm" },
  { "kopischke/vim-fetch" },         -- gf with lnum:col included(:e test.rb:42,69)
  { "MattesGroeger/vim-bookmarks" }, -- Bookmarks with space
  { "AndrewRadev/undoquit.vim" },

  { "winston0410/cmd-parser.nvim" }, -- requiremet for nvim-colorizer
  { "NvChad/nvim-colorizer.lua" }, -- Shows color by code


  -- Indentation
  { "mhartington/formatter.nvim" },

  -- nginx
  { "chr4/nginx.vim" },

  -- lsp
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim", 'neovim/nvim-lspconfig' } },
  { 'nvimdev/lspsaga.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' } }, -- UI for lsp
  { "onsails/lspkind-nvim" }, -- kind of autocomplite
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" }, -- action float window

  --    ruby
  { "tpope/vim-rbenv" },  -- improve nvim ruby loading
  { "tpope/vim-bundler", ft = { "Gemfile", "Rakefile", "ruby" } },
  { "tpope/vim-rails", ft = { "ruby", "eruby" } },
  { "tpope/vim-rake" },
  --    markdown
  { "iamcco/markdown-preview.nvim", cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" }, ft = { "markdown" }, build = function() vim.fn["mkdp#util#install"]() end }, -- Markdown live preview
  --    yaml
  { "lmeijvogel/vim-yaml-helper" }, -- substirute to https://github.com/cuducos/yaml.nvim after https://github.com/nvim-treesitter/nvim-treesitter/issues/1352

  --    Search
  ----------------------------------------------
  -- Plug "eugen0329/vim-esearch"         -- Project-wide search
  { "mario-amazing/vim-esearch" },
  { "eugen0329/vim-concertina" },
  { "rapan931/lasterisk.nvim" },       -- *-improved

  -- Autocomplete
  --------------------------------------
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "lukas-reineke/cmp-rg" },
  { "quangnguyen30192/cmp-nvim-tags" },
  { "saadparwaiz1/cmp_luasnip" },
  -- Snippets
  ------------------------------
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } }, -- snippets collection
  { "mattn/emmet-vim" },        -- html tags expand div>h1

  -- Tags
  { "ludovicchabant/vim-gutentags" },
})
vim.loader.enable()
