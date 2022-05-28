require('lualine').setup {
 options = {
    icons_enabled = true,
    -- theme  = 'gruvbox_dark',
    -- theme  = 'gruvbox-material',
    theme  = 'wombat',
    -- theme  = 'seoul256',
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
  tabline = {},
  extensions = {}
}
