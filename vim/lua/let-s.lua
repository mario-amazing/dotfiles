-- Common
vim.g.mapleader = ','

-- splitjoin
vim.g.splitjoin_ruby_trailing_comma = 1
vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_hanging_args = 0

-- Bookmarks
vim.g.bookmark_save_per_working_dir = 1
vim.g.bookmark_sign = ' '
vim.g.bookmark_annotation_sign = ' ﮉ'
vim.g.bookmark_show_toggle_warning = 0
vim.g.bookmark_center = 1

-- switch.vim
vim.g.switch_mapping = '-'

-- vim-over
vim.g.over_command_line_prompt = ':'

-- emmet
vim.g.user_emmet_mode='iv' --  modes, in which Emmet mappings will be created(insert/visual)

-- tabular
vim.g.tabular_default_format = "l0"

-- pasta
vim.g.pasta_disabled_filetypes = {'esearch'}

-- gitv
vim.g.Gitv_DoNotMapCtrlKey = 1

-- lightspeed
vim.g.lightspeed_no_default_keymaps  =true

--emmet
vim.g.user_emmet_leader_key = '<Leader>'

-- " vvv https://github.com/terryma/vim-expand-region
vim.g.expand_region_text_objects = {
  ['iw'] = 0,
  ['iW'] = 0,
  ['i"'] = 1,
  ["i'"] = 1,
  ['i]'] = 1,
  ['ib'] = 1,
  ['iB'] = 1,
  ['il'] = 0,
  ['ip'] = 0,
  ['ie'] = 0,
}

-- sandwich
vim.g.sandwich_no_default_key_mappings = 1
vim.g.operator_sandwich_no_default_key_mappings = 1

-- vim-xkbswitch
vim.g.XkbSwitchLib = '/usr/local/bin/libxkbswitch.dylib'
vim.g.XkbSwitchEnabled = 1

-- vim-matchup
vim.g.matchup_matchparen_offscreen = {['method'] = 'popup'}

-- vim-floaterm
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

-- vim-gutentags
vim.g.gutentags_enabled = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_resolve_symlinks = 1
vim.g.gutentags_ctags_tagfile = '.git/tags'
vim.g.gutentags_project_root = { '.git' }
vim.g.gutentags_ctags_extra_args = { '--fields=+l' }
vim.g.gutentags_add_default_project_roots = 0
vim.g.gutentags_ctags_executable_ruby = 'ripper-tags'
vim.g.gutentags_ctags_extra_args = { '--ignore-unsupported-options', '--recursive' }

-- vim-yaml-helper
-- let g:vim_yaml_helper#always_get_root = 1 -- add root path to yaml copy
