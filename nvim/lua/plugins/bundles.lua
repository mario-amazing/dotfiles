return {
  -- Motion
  ----------------------
  -- { "bkad/CamelCaseMotion" },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    dependencies = { { "rami3l/nvim-spider-utf8", build = "rockspec" } },
  }, -- navigation w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.

  -- Telescop
  ------------------------------
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- bookmarks telescop visual
  { 'tom-anders/telescope-vim-bookmarks.nvim' }, -- bookmarks telescop visual
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- fuzzy search
  { 'prochri/telescope-all-recent.nvim', dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua", "stevearc/dressing.nvim" } },
  -- TODO think about add projects https://github.com/nvim-telescope/telescope-project.nvim or https://github.com/cljoly/telescope-repo.nvim

  -- Git
  ------------------------------
  { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" }, lazy = false },
  { "dinhhuy258/git.nvim" }, -- main git commands
  { "rhysd/conflict-marker.vim" },
  { "lewis6991/gitsigns.nvim" }, -- Add git line status(|/=/~) to the left of a line and Git diff


  -- Textobjects
  ------------------------------------------------------
  { "terryma/vim-expand-region", lazy = false }, -- Easier way to select textobjects(vvv)
  { "wellle/targets.vim", event = { "BufReadPre", "BufNewFile" }  },        -- Select inside({[]}) vi( va( vi" va"
  { "andymass/vim-matchup", event = { "BufReadPre", "BufNewFile" } },       -- extends vim"s % key
  { "windwp/nvim-ts-autotag", event = "VeryLazy" },    -- auto rename closing tags

  -- Editing assistants
  { "AndrewRadev/switch.vim", lazy = false },    -- Switch segments of text with predefined replacements(-)
  { "tpope/vim-abolish", event = { "BufReadPre", "BufNewFile" } },         -- Working with word Cases(crs/crm/cru)
  { "AndrewRadev/splitjoin.vim", event = { "BufReadPre", "BufNewFile" } }, -- Split/Join(gS/gJ)
  { "Wansmer/sibling-swap.nvim", dependencies = { 'nvim-treesitter' } }, -- Move an item in a delimiter-separated list left or right(S-h/S-l)
  { "Wansmer/treesj", event = { "BufReadPre", "BufNewFile" }, dependencies = { 'nvim-treesitter/nvim-treesitter' } },            -- Main Split/Join -> fallback to splitjoin.vim
  { "nat-418/boole.nvim" },        -- CTRL-A/CTRL-X to increment dates, times, and more
  { "hrsh7th/nvim-pasta", event = "VeryLazy" },        -- smart paste, override (p and P)!!!
  { "fedepujol/move.nvim" },       -- Move lines and blocks

  { "kylechui/nvim-surround", version = "*", event = "VeryLazy" }, -- Manage code surroundings(quotes, parenthesis, brackets, *ml-tags etc.)
  { "machakann/vim-sandwich", event = { "BufReadPre", "BufNewFile" } },    -- Add #{} surround to ruby string

  { "junegunn/vim-easy-align", event = "VeryLazy" },   -- Text align lines symbols(ga)
  { 'windwp/nvim-autopairs', event = "InsertEnter" }, -- auto pair: { [ ( " Auto adding end after blocks

  { "tpope/vim-commentary", event = { "BufReadPre", "BufNewFile" } },      -- Comment/uncomment code
  { "JoosepAlviste/nvim-ts-context-commentstring" }, -- treesitter context comments


  -- Tools
  ------------------------------
  { "kopischke/vim-fetch", lazy = false },         -- gf with lnum:col included(:e test.rb:42,69)
  { "MattesGroeger/vim-bookmarks", event = { "BufReadPre", "BufNewFile" } }, -- Bookmarks with space

  { "NvChad/nvim-colorizer.lua" }, -- Shows color by code


  -- Indentation
  { "mhartington/formatter.nvim", lazy = false },

  --    ruby
  { "tpope/vim-rbenv", event = { "BufReadPre", "BufNewFile" } },  -- improve nvim ruby loading
  { "tpope/vim-bundler", ft = { "Gemfile", "Rakefile", "ruby" } },
  { "tpope/vim-rails", ft = { "ruby", "eruby" } },
  --    markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }, -- Markdown live preview
  { "lmeijvogel/vim-yaml-helper", event = "VeryLazy"  }, -- substirute to https://github.com/cuducos/yaml.nvim after https://github.com/nvim-treesitter/nvim-treesitter/issues/1352

  --    Search
  ----------------------------------------------
  -- Plug "eugen0329/vim-esearch"         -- Project-wide search
  { "mario-amazing/vim-esearch", lazy = false },
  { "eugen0329/vim-concertina" },  -- Accordion-like windows layout
  { "rapan931/lasterisk.nvim" },       -- *-improved

  -- Snippets
  ------------------------------
  { "mattn/emmet-vim", commit = "3fb2f63", lazy = false },        -- html tags expand div>h1

  -- Tags
  { "ludovicchabant/vim-gutentags", lazy = false },
}
