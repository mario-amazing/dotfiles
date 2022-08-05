vim.cmd 'source ~/.vim/modules/bundles.vim'
vim.cmd 'source ~/.vim/modules/misc.vim'

require('impatient')-- .enable_profile() -- profiling with :LuaCacheProfile
require('plugins/alpha-nvim')
require('colors')
require('set-s')
require('let-s')
require('helpers')
require('init')
require('mappings')
require('lsp')
require('lualine_nvim')
require('autocmds')
require('completion')

-- ======== Tips:
-- lua config https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- icons -> https://www.nerdfonts.com/cheat-sheet
-- :au TextChangedI #(Run after typing) Debugging what plugins were run during text typing.
-- :verbose vmap , # Show mapping for
-- vim -u test_vimrc # Run vim with test_vimrc as source file
