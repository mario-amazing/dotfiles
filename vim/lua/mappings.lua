-- Common
-- xnoremap p pgvy -- Not override clipboard on paste (currently fixed/overrides with vim-pasta)
-- Misc
vim.keymap.set('n', '<S-q>', '<cmd>q<CR>', { silent = true})
vim.keymap.set('n', '<C-s>', '<cmd>write<CR>')
vim.keymap.set('n', '<C-c>', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>', { silent = true })
vim.keymap.set('n', '<S-u>', '<cmd>redo<CR>')
vim.keymap.set('n', '<S-u>', '<cmd>redo<CR>')
-- TODO add https://github.com/voldikss/vim-floaterm :term pry !!!!!!!!!!
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
-- scroll moves
vim.keymap.set('n', 'j', 'gj')          -- scroll by long line
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<C-y>', '2<C-y>')  -- Scroll screen up
vim.keymap.set('n', '<C-e>', '2<C-e>')  -- Scroll screen down
vim.keymap.set('n', '<C-i>', '<C-i>zz', { silent = true })
vim.keymap.set('n', '<C-o>', '<C-o>zz', { silent = true })
-- markup
vim.keymap.set('n', '<F8>', '<cmd>let w:v=winsaveview()<cr>ggVG=<cmd>call winrestview(w:v)<cr>', { silent = true })
vim.keymap.set('n', 'i', 'IndentWithI()', { expr = true})
-- jump window
vim.keymap.set('', '<C-k>', '<C-w><C-k>', { silent = true })
vim.keymap.set('', '<C-j>', '<C-w><C-j>', { silent = true })
vim.keymap.set('', '<C-l>', '<C-w><C-l>', { silent = true })
vim.keymap.set('', '<C-h>', '<C-w><C-h>', { silent = true })
-- tabs
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<CR>', { silent = true })
vim.keymap.set('n', '<Tab>', 'gt', { silent = true })
vim.keymap.set('n', '<S-Tab>', 'gT', { silent = true })
vim.keymap.set('n', 'g1', '1gt', { silent = true })
vim.keymap.set('n', 'g2', '2gt', { silent = true })
vim.keymap.set('n', 'g3', '3gt', { silent = true })
vim.keymap.set('n', 'g4', '4gt', { silent = true })
vim.keymap.set('n', 'g5', '5gt', { silent = true })
vim.keymap.set('n', 'g6', '6gt', { silent = true })
vim.keymap.set('n', 'g7', '7gt', { silent = true })
vim.keymap.set('n', 'g8', '8gt', { silent = true })
vim.keymap.set('n', 'g9', '9gt', { silent = true })
vim.keymap.set('n', 'g0', '10gt', { silent = true })

-- git
vim.keymap.set('', '<Leader>gg', '<cmd>Git<space>')
vim.keymap.set('', '<Leader>gs', '<cmd>Gtabedit :<CR>', { silent = true })
vim.keymap.set('', '<Leader>gc', '<cmd>Git commit<CR>', { silent = true })
vim.keymap.set('', '<Leader>gp', '<cmd>Git push<CR>', { silent = true })
vim.keymap.set('', '<Leader>gd', '<cmd>Gitsigns diffthis<CR> ', { silent = true })
vim.keymap.set('', '<Leader>gl', '<cmd>Telescope git_commits<CR>', { silent = true })
vim.keymap.set('', '<leader>gb', '<cmd>Git blame<CR> ', { silent = true })
vim.keymap.set('', '<leader>gh', '<cmd>Telescope git_stash<CR>', { silent = true })
vim.keymap.set('', '<leader>gb', '<cmd>NvimTreeClose<cr><cmd>Git blame<cr> ', { silent = true })
vim.keymap.set('', '<Leader>gfl', '<cmd>Telescope git_bcommits<CR> ', { silent = true }) -- logs current file
vim.keymap.set('', '<Leader>dp', '<cmd>diffput<CR> ', { silent = true })

-- move.nvim
vim.keymap.set('n', '<A-j>', '<cmd>MoveLine(1)<CR>', { silent = true })    --  '<A-j>'
vim.keymap.set('n', '<A-k>', '<cmd>MoveLine(-1)<CR>', { silent = true })   --  '<A-k>'
vim.keymap.set('v', '<A-j>', '<cmd>MoveBlock(1)<CR>', { silent = true })   --  '<A-j>'
vim.keymap.set('v', '<A-k>', '<cmd>MoveBlock(-1)<CR>', { silent = true })  --  '<A-k>'
vim.keymap.set('n', '<A-l>', '<cmd>MoveHChar(1)<CR>', { silent = true })   --  '<A-l>'
vim.keymap.set('n', '<A-h>', '<cmd>MoveHChar(-1)<CR>', { silent = true })  --  '<A-h>'
vim.keymap.set('v', '<A-l>', '<cmd>MoveHBlock(1)<CR>', { silent = true })  --  '<A-l>'
vim.keymap.set('v', '<A-h>', '<cmd>MoveHBlock(-1)<CR>', { silent = true }) --  '<A-h>'

-- vim-surround
vim.keymap.set('v', '"',  '<Plug>VSurround"')
vim.keymap.set('v', "'",  "<Plug>VSurround'")
vim.keymap.set('n', 'd"', '<Plug>Dsurround"')
vim.keymap.set('n', 'dt', '<Plug>Dsurroundt')
vim.keymap.set('n', "d'", "<Plug>Dsurround'")

-- Bookmarks
vim.keymap.set('n', '<Space><Space>', '<Plug>BookmarkToggle')
vim.keymap.set('n', '<Space>i', '<Plug>BookmarkAnnotate')
vim.keymap.set('n', '<Space>a', '<cmd>Telescope vim_bookmarks all<CR>')
vim.keymap.set('n', '<Space>j', '<Plug>BookmarkNext')
vim.keymap.set('n', '<Space>k', '<Plug>BookmarkPrev')

-- Navigation nvim-tree
vim.keymap.set('n', '<Leader>t', '<cmd>NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ft', '<cmd>NvimTreeFindFile<CR>', { silent = true })

-- Telescope
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<C-f><C-m>', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<C-f><C-t>', '<cmd>Telescope filetypes<CR>')
vim.keymap.set('n', '<Leader>mc', '<cmd>Telescope find_files cwd=~/.vim/modules<CR>')
-- LSP
vim.keymap.set('n', 'gd', '<cmd>Telescop lsp_definitions<cr>', { silent = true })
vim.keymap.set('n', 'gr', '<cmd>Telescop lsp_references<cr>', { silent = true })
vim.keymap.set('n', '<space>e', '<cmd>Telescop diagnostics<cr>', { silent = true })

-- Search by asterisk(*)
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('', '*', '<Plug>(asterisk-gz*)', { silent = true })
vim.keymap.set('n', '<CR>', '<cmd>nohl<CR><cmd><Esc>')

-- nvim-colorizer
vim.keymap.set('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { silent = true})

-- undoquit.vim
vim.keymap.set('n', '<C-w>u', '<cmd>Undoquit', { silent = true})

-- lightspeed
vim.keymap.set('n', 'gs', '<Plug>Lightspeed_s', { silent = true })
vim.keymap.set('n', 'gS', '<Plug>Lightspeed_S', { silent = true })
vim.keymap.set('n', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.keymap.set('n', 'F', '<Plug>Lightspeed_F', { silent = true })

-- Breakpoints
vim.keymap.set('n', '<F5>', '<cmd>lua RemoveBreakpoints()<CR>', {silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>lua ToggleBreakpoint()<CR>', { silent = true})

-- shime/vim-livedown
vim.keymap.set('n', '<leader>lp', '<cmd>LivedownToggle<CR>')

-- sideways
vim.keymap.set('n', '<S-h>', '<cmd>SidewaysLeft<CR>')
vim.keymap.set('n', '<S-l>', '<cmd>SidewaysRight<CR>')

-- CamelCaseMotion
vim.keymap.set('', '<S-W>', '<Plug>CamelCaseMotion_w')
vim.keymap.set('', '<S-B>', '<Plug>CamelCaseMotion_b')
vim.keymap.set('', '<S-E>', '<Plug>CamelCaseMotion_e')

-- sandwich
vim.keymap.set('x', 'S#', '<Plug>(operator-sandwich-add)i#{<cr>}<cr>')

-- vim-expand-region
vim.keymap.set('v', 'v',     '<Plug>(expand_region_expand)')
vim.keymap.set('v', '<C-v>', '<Plug>(expand_region_shrink)')

-- vim-commentary
vim.keymap.set('v', 'c',  '<Plug>Commentary')
