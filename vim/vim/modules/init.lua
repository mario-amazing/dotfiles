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


-- # TODO add sync across all of the tabs https://github.com/kyazdani42/nvim-tree.lua/issues/457
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

local list = {
  { key = "<Tab>", action = "" },
  { key = "w",action = "preview" },

  { key = "<C-t>", action = "" },
  { key = "t",action = "tabnew" },
}

require'nvim-tree'.setup {
  update_focused_file = { update_cwd = true },
  view = { mappings = { list = list } },
  filters = { dotfiles = true },
}
