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
-- :verbose map(vmap, imap) , # Show mapping for
-- vim -u test_vimrc # Run vim with test_vimrc as source file
-- https://github.com/crivotz/nv-ide last config synced on Aug 9, 2022 fe011790251d52fdd8057bf23ebe387cb0a952fa
