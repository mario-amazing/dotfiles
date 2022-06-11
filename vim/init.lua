require('~/.vim/modules/colors.lua')
require('~/.vim/modules/options.lua')
require('~/.vim/modules/helpers.lua')
require('~/.vim/modules/init.lua')
require('~/.vim/modules/lsp.lua')
require('~/.vim/modules/lualine.lua ')
require('~/.vim/modules/mappings.lua')

fu! s:load(module)
  exec 'source ' fnameescape(expand('~/.vim/modules/' . a:module . '.vim'))
endfu

call s:load('bundles')

call s:load('ncompletion')

call s:load('autocmds')

call s:load('helpers')
call s:load('plugins')
call s:load('mappings')

call s:load('misc')


-- ======== Tips:
-- lua config https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- icons -> https://www.nerdfonts.com/cheat-sheet
-- :au TextChangedI #(Run after typing) Debugging what plugins were run during text typing.
-- :verbose vmap , # Show mapping for
-- vim -u test_vimrc # Run vim with test_vimrc as source file
