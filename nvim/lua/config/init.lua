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


require('nvim-ts-autotag').setup({})
