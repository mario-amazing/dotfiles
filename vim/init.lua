vim.cmd 'source ~/.vim/modules/bundles.vim'
vim.cmd 'source ~/.vim/modules/ncompletion.vim'
vim.cmd 'source ~/.vim/modules/autocmds.vim'
vim.cmd 'source ~/.vim/modules/misc.vim'

require('colors')
require('set-s')
require('let-s')
require('helpers')
require('init')
require('mappings')
require('lsp')
require('lualine_nvim')

-- ======== Tips:
-- lua config https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- icons -> https://www.nerdfonts.com/cheat-sheet
-- :au TextChangedI #(Run after typing) Debugging what plugins were run during text typing.
-- :verbose vmap , # Show mapping for
-- vim -u test_vimrc # Run vim with test_vimrc as source file
