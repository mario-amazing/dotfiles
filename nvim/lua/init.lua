-- NOTE ignore in search files from .gitignore
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous
      }
    },
    prompt_prefix = "🔎 ",
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
      hidden = true,
    }
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('vim_bookmarks')
require("telescope").load_extension("persisted")


require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true }, -- alternative vim.lsp.buf.formatting
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  ensure_installed = { "ruby", 'vim', "lua", 'dockerfile', 'html', 'json', "javascript", "typescript", 'tsx', "css", "scss", "regex", "yaml", "bash", "astro", "markdown", "markdown_inline", "python", "nginx" },

  -- extension vim-matchup
  matchup = { enable = true, disable_virtual_text = true },
  -- extension nvim-ts-autotag
  autotag = { enable = true },
  -- playground
  playground = { enable = true },
}

local prettierd_formatter = function()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = prettierd_formatter,
    astro = prettierd_formatter
  }
})

require('lightspeed').setup {
  ignore_case = true,
  repeat_ft_with_target_char = true,
}


-- nvim-tree
require('nvim-tree').setup {
  on_attach = on_attach_nvim_tree,
  update_focused_file = { update_cwd = true },
  filters = { dotfiles = true },
  git = { ignore = false },
  tab = { sync = { open = false, close = true, ignore = {} } },
}


-- You can use treesitter to check for a pair.
require('nvim-autopairs').setup({ disable_filetype = { "TelescopePrompt" , --[["vim"]] } })
require('nvim-autopairs').add_rules(require('nvim-autopairs.rules.endwise-ruby')) -- Auto adding end after blocks
require('nvim-autopairs').add_rules(require('nvim-autopairs.rules.endwise-lua')) -- Auto adding end after blocks


require('gitsigns').setup()


-- nvim-colorizer.lua
require('colorizer').setup({
  filetypes = {'css', 'javascript'},
    user_default_options = {
      RGB      = true;         -- #RGB hex codes
      RRGGBB   = true;         -- #RRGGBB hex codes
      names    = true;         -- "Name" codes like Blue
      RRGGBBAA = true;         -- #RRGGBBAA hex codes
      rgb_fn   = true;         -- CSS rgb() and rgba() functions
      hsl_fn   = true;         -- CSS hsl() and hsla() functions
      css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
    }})


-- friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()


-- boole.nvim
require('boole').setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
  }
})


require("persisted").setup()


-- git.nvim
require('git').setup({default_mappings = false})


require("nvim-surround").setup()


require('sibling-swap').setup({})


require('treesj').setup({
  use_default_keymaps = true,
  check_syntax_error = true,
  max_join_length = 9999,
  cursor_behavior = 'hold',
  notify = true,
  dot_repeat = true,
})


require('dressing').setup({ input = { enabled = false }})


require('ts_context_commentstring').setup {
  enable_autocmd = false,
}


-- fedepujol/move.nvim
require('move').setup({
  line = { indent = false },
  block = { indent = false }
})


require("telescope-all-recent").setup({})


require("spider").setup { skipInsignificantPunctuation = true }
