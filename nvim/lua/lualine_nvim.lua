-- If need searchMatchesCount
-- https://github.com/nvim-lualine/lualine.nvim/issues/186#issuecomment-968392445
require('lualine').setup {
 options = {
    icons_enabled = true,
    -- theme  = 'gruvbox-material',
    -- theme  = 'seoul256',
    theme  = 'wombat',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    globalstatus = true,
  },
  sections = {
    lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {'diff'},
    lualine_x = {{'filetype', colored = false }},
    lualine_y = {'progress'},
    lualine_z = {{'location', padding = 1}}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        max_length = vim.o.columns,
        mode = 2,
        tabs_color = { active = 'lualine_b_normal' },
        separator = { left = '', right = '' },
      },
    },
  },
  extensions = {}
}
