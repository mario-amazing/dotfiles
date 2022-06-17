-- Common
-- xnoremap p pgvy -- Not override clipboard on paste (currently fixed/overrides with vim-pasta)
-- Misc
vim.api.nvim_set_keymap('n', '<S-q>', '<cmd>q<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>write<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-u>', '<cmd>redo<CR>', {})
vim.api.nvim_set_keymap('n', '<S-u>', '<cmd>redo<CR>', {})
-- TODO add https://github.com/voldikss/vim-floaterm :term pry !!!!!!!!!!
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true })
-- scroll moves
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })          -- scroll by long line
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-y>', '2<C-y>', { noremap = true })  -- Scroll screen up
vim.api.nvim_set_keymap('n', '<C-e>', '2<C-e>', { noremap = true })  -- Scroll screen down
-- markup
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>let w:v=winsaveview()<cr>ggVG=<cmd>call winrestview(w:v)<cr>', { noremap = true, silent = true })
-- jump window
vim.api.nvim_set_keymap('', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })
-- tabs
vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', 'gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g8', '8gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g9', '9gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g0', '10gt', { noremap = true, silent = true })

-- git
vim.api.nvim_set_keymap('', '<Leader>gg', '<cmd>Git<space>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>gs', '<cmd>Gtabedit :<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<Leader>gc', '<cmd>Git commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<Leader>gp', '<cmd>Git push<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<Leader>gd', '<cmd>Gitsigns diffthis<CR> ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<Leader>gl', '<cmd>Telescope git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>gb', '<cmd>Git blame<CR> ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>gh', '<cmd>Telescope git_stash<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>gb', '<cmd>NvimTreeClose<cr><cmd>Git blame<cr> ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<Leader>gfl', '<cmd>Telescope git_bcommits<CR> ', { noremap = true, silent = true }) -- logs current file
vim.api.nvim_set_keymap('', '<Leader>dp', '<cmd>diffput<CR> ', { noremap = true, silent = true })

-- move.nvim
vim.api.nvim_set_keymap('n', '<A-j>', '<cmd>MoveLine(1)<CR>', { noremap = true, silent = true })    --  '<A-j>'
vim.api.nvim_set_keymap('n', '<A-k>', '<cmd>MoveLine(-1)<CR>', { noremap = true, silent = true })   --  '<A-k>'
vim.api.nvim_set_keymap('v', '<A-j>', '<cmd>MoveBlock(1)<CR>', { noremap = true, silent = true })   --  '<A-j>'
vim.api.nvim_set_keymap('v', '<A-k>', '<cmd>MoveBlock(-1)<CR>', { noremap = true, silent = true })  --  '<A-k>'
vim.api.nvim_set_keymap('n', '<A-l>', '<cmd>MoveHChar(1)<CR>', { noremap = true, silent = true })   --  '<A-l>'
vim.api.nvim_set_keymap('n', '<A-h>', '<cmd>MoveHChar(-1)<CR>', { noremap = true, silent = true })  --  '<A-h>'
vim.api.nvim_set_keymap('v', '<A-l>', '<cmd>MoveHBlock(1)<CR>', { noremap = true, silent = true })  --  '<A-l>'
vim.api.nvim_set_keymap('v', '<A-h>', '<cmd>MoveHBlock(-1)<CR>', { noremap = true, silent = true }) --  '<A-h>'

-- Bookmarks
vim.api.nvim_set_keymap('n', '<Space><Space>', '<Plug>BookmarkToggle', {})
vim.api.nvim_set_keymap('n', '<Space>i', '<Plug>BookmarkAnnotate', {})
vim.api.nvim_set_keymap('n', '<Space>a', '<cmd>Telescope vim_bookmarks all<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>j', '<Plug>BookmarkNext', {})
vim.api.nvim_set_keymap('n', '<Space>k', '<Plug>BookmarkPrev', {})

-- Navigation nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>t', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<C-f><CR>', '<cmd>Telescope oldfiles<cr>', {}) -- <C-f><C-m>
vim.api.nvim_set_keymap('n', '<C-f><C-t>', '<cmd>Telescope filetypes<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>mc', '<cmd>Telescope find_files cwd=~/.vim/modules<CR>', {})
-- LSP
vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescop lsp_definitions<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescop lsp_references<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>Telescop diagnostics<cr>', { noremap = true, silent = true })

-- Search by asterisk(*)
vim.api.nvim_set_keymap('n', 'n', 'nzz', {})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {})
vim.api.nvim_set_keymap('', '*', '<Plug>(asterisk-gz*)', { silent = true })
vim.api.nvim_set_keymap('n', '<CR>', '<cmd>nohl<CR><cmd><Esc>', { noremap = true })

-- nvim-colorizer
vim.api.nvim_set_keymap('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { noremap = true, silent = true})

-- undoquit.vim
vim.api.nvim_set_keymap('n', '<C-w>u', '<cmd>Undoquit', { noremap = true, silent = true})

-- lightspeed
vim.api.nvim_set_keymap('n', 'gs', '<Plug>Lightspeed_s', { silent = true })
vim.api.nvim_set_keymap('n', 'gS', '<Plug>Lightspeed_S', { silent = true })
vim.api.nvim_set_keymap('n', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.api.nvim_set_keymap('n', 'F', '<Plug>Lightspeed_F', { silent = true })

-- Breakpoints
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua RemoveBreakpoints()<CR>', { noremap = true,silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua ToggleBreakpoint()<CR>', { noremap = true, silent = true})

-- shime/vim-livedown
vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>LivedownToggle<CR>', {})

-- sideways
vim.api.nvim_set_keymap('n', '<S-h>', '<cmd>SidewaysLeft<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', '<cmd>SidewaysRight<CR>', { noremap = true })
