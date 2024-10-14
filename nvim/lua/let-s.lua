vim.filetype.add({ extension = { mdx = "markdown.mdx" } }) -- astro

-- Common
vim.g.mapleader = ','

-- lazygit.nvim
-- vim.g.lazygit_use_custom_config_file_path = 1
-- vim.g.lazygit_config_file_path = '~/.config/lazygit/config.yml'

-- splitjoin
vim.g.splitjoin_ruby_trailing_comma = 1
vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_hanging_args = 0

-- Bookmarks
vim.g.bookmark_save_per_working_dir = 1
vim.g.bookmark_sign = ''
vim.g.bookmark_annotation_sign = ' ﮉ'
vim.g.bookmark_show_toggle_warning = 0
vim.g.bookmark_center = 1

-- vim-over
vim.g.over_command_line_prompt = ':'

-- tabular
vim.g.tabular_default_format = "l0"

-- gitv
vim.g.Gitv_DoNotMapCtrlKey = 1

-- lightspeed
vim.g.lightspeed_no_default_keymaps  =true

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
vim.g.gutentags_ctags_extra_args = { '--exclude=.git', '--exclude=node_modules' }
vim.g.gutentags_add_default_project_roots = 0
vim.g.gutentags_ctags_executable_ruby = 'ripper-tags'
vim.g.gutentags_ctags_extra_args_ruby = { '--ignore-unsupported-options', '--recursive' }
-- vim.g.gutentags_trace = 1

-- vim-yaml-helper
-- let g:vim_yaml_helper#always_get_root = 1 -- add root path to yaml copy
vim.g["vim_yaml_helper#auto_display_path"] = 0

-- vim-rails
vim.g.rails_projections = {
  ['app/controllers/concerns/*.rb'] = {
    ['test'] = {
      'spec/controllers/concerns/{}_spec.rb',
      'spec/requests/concerns/{}_spec.rb'
    },
  },
  ['spec/requests/concerns/*_spec.rb'] = {
    ['alternate'] = {
      'app/controllers/concerns/{}.rb',
    },
  },
  ['app/controllers/*_controller.rb'] = {
    ['test'] = {
      'spec/controllers/{}_controller_spec.rb',
      'spec/requests/{}_controller_spec.rb'
    },
  },
  ['spec/requests/*_controller_spec.rb'] = {
    ['alternate'] = {
      'app/controllers/{}_controller.rb',
    },
  }
}

-- r4mmer/markdown-preview.nvim
vim.g.mkdp_theme = 'light'
vim.g.mkdp_preview_options = { ['disable_sync_scroll'] = 1 }

-- nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true
