require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}
require('telescope').load_extension("frecency")
require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup {
  ensure_installed = { "ruby", "lua", "javascript", 'dockerfile', 'html', 'json' },
  highlight = { enable = true },
}
require('lightspeed').setup {
  ignore_case = true,
  repeat_ft_with_target_char = true,
}
