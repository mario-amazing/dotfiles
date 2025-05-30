vim.cmd 'source ~/.config/nvim/lua/vim_modules/misc.vim'

require('config/lazy-conf')
require('config/set-s')
require('config/let-s')
require('config/helpers')
require('config/init')
require('config/mappings')
require('config/autocmds')

-- ======== Tips:
-- :source $MYVIMRC -> reload config
-- https://github.com/crivotz/nv-ide last config synced on Jun 9, 2023 0b8f5eda0f853b27b143f093ec1ed586a22906ce
-- lua config https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- icons -> https://www.nerdfonts.com/cheat-sheet
-- :au TextChangedI #(Run after typing) Debugging what plugins were run during text typing.
-- :verbose map(vmap, imap) , # Show mapping for
-- vim -u test_vimrc # Run vim with test_vimrc as source file
-- find indent functrion :set indentexpr? -> verbose fu GetRubyIndent
