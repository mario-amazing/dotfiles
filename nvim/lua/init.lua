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
      theme = "dropdown",
      hidden = true,
    }
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('vim_bookmarks')
require("telescope").load_extension("persisted")


require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  -- indent = { enable = true }, -- alternative vim.lsp.buf.formatting
  ensure_installed = { "ruby", 'vim', "lua", 'dockerfile', 'html', 'json', "javascript", "typescript", 'tsx', "css", "scss", "regex", "yaml" },
  -- indent = { enable = true }, -- Experimental

  -- extension vim-matchup
  matchup = { enable = true, disable_virtual_text = true },
  -- extension nvim-ts-context-commentstring(comment by treesitter line type)(html with js and css)
  context_commentstring = { enable = true },
  -- extension nvim-ts-autotag
  autotag = { enable = true },
  -- playground
  playground = { enable = true },
}


require('lightspeed').setup {
  ignore_case = true,
  repeat_ft_with_target_char = true,
}


-- nvim-tree
local list = {
  { key = "<Tab>", action = "" },
  { key = "w",     action = "preview" },

  { key = "<C-t>", action = "" },
  { key = "t",     action = "tabnew" },

  { key = "<S-A>", action = "toggle_full_width", action_cb = toggle_full_width },
}

require('nvim-tree').setup {
  update_focused_file = { update_cwd = true },
  view = { mappings = { list = list } },
  filters = { dotfiles = true },
  git = { ignore = false }
}

-- TODO add sync across all of the tabs https://github.com/kyazdani42/nvim-tree.lua/issues/457
--
-- TODO Check this discussion: (auto close if last buffer is Nvim-tree)
-- https://github.com/kyazdani42/nvim-tree.lua/discussions/1115
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
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


require('neoscroll').setup()


-- friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()


require("persisted").setup()


-- git.nvim
require('git').setup({default_mappings = false})


require("nvim-surround").setup()


require("icon-picker").setup({ disable_legacy_commands = true })
