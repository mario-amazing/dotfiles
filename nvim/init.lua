vim.cmd 'source ~/.config/nvim/lua/vim_modules/bundles.vim'
vim.cmd 'source ~/.config/nvim/lua/vim_modules/misc.vim'

require('impatient')-- .enable_profile() -- profiling with :LuaCacheProfile
require('plugins/alpha-nvim')
require('colors')
require('set-s')
require('let-s')
require('helpers')
require('nvim-tree-on-attach')
require('init')
require('lsp')
require('mappings')
require('lualine_nvim')
require('autocmds')
require('completion')

-- ======== Tips:
-- :source $MYVIMRC -> reload config
-- https://github.com/crivotz/nv-ide last config synced on Oct 10, 2022 89043c62e00dc7f9dc78b0e527b36660ca5ea6d0
-- lua config https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- icons -> https://www.nerdfonts.com/cheat-sheet
-- :au TextChangedI #(Run after typing) Debugging what plugins were run during text typing.
-- :verbose map(vmap, imap) , # Show mapping for
-- vim -u test_vimrc # Run vim with test_vimrc as source file
-- find indent functrion :set indentexpr? -> verbose fu GetRubyIndent
