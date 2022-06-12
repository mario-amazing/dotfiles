-- Common
-- xnoremap p pgvy -- Not override clipboard on paste (currently fixed/overrides with vim-pasta)
-- quit
vim.api.nvim_set_keymap('n', '<S-q>', ':q<CR>', { silent = true})
-- jump window
vim.api.nvim_set_keymap('', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })

-- move.nvim TODO FIX ALT
-- vim.api.nvim_set_keymap('n', '<C-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', ':MoveHChar(1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-h>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-l>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-h>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })

-- Bookmarks
vim.api.nvim_set_keymap('n', '<Space><Space>', '<Plug>BookmarkToggle', {})
vim.api.nvim_set_keymap('n', '<Space>i', '<Plug>BookmarkAnnotate', {})
vim.api.nvim_set_keymap('n', '<Space>a', ':Telescope vim_bookmarks all<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>j', '<Plug>BookmarkNext', {})
vim.api.nvim_set_keymap('n', '<Space>k', '<Plug>BookmarkPrev', {})

-- Navigation nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<C-f><CR>', ':Telescope oldfiles<cr>', {}) -- <C-f><C-m>
vim.api.nvim_set_keymap('n', '<C-f><C-t>', ':Telescope filetypes<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>mc', ':Telescope find_files cwd=~/.vim/modules<CR>', {})
-- LSP
vim.api.nvim_set_keymap('n', 'gd', ':Telescop lsp_definitions<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':Telescop lsp_references<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>e', ':Telescop diagnostics<cr>', { noremap = true, silent = true })

-- Search by asterisk(*)
vim.api.nvim_set_keymap('n', 'n', 'nzz', {})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {})
vim.api.nvim_set_keymap('', '*', '<Plug>(asterisk-gz*)', { silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':nohl<CR>:<Esc>', { noremap = true })

-- nvim-colorizer
vim.api.nvim_set_keymap('n', '<Leader>ct', ':ColorizerToggle<CR>', { noremap = true, silent = true})

-- undoquit.vim
vim.api.nvim_set_keymap('n', '<C-w>u', ':Undoquit', { noremap = true, silent = true})

-- lightspeed
vim.api.nvim_set_keymap('n', 'gs', '<Plug>Lightspeed_s', { silent = true })
vim.api.nvim_set_keymap('n', 'gS', '<Plug>Lightspeed_S', { silent = true })
vim.api.nvim_set_keymap('', 's', 's', { silent = true})
vim.api.nvim_set_keymap('', 'S', 'S', { silent = true})

-- Breakpoints
vim.api.nvim_set_keymap('n', '<F5>', ':lua RemoveBreakpoints()<CR>', { noremap = true,silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':lua ToggleBreakpoint()<CR>', { noremap = true, silent = true})

-- shime/vim-livedown
vim.api.nvim_set_keymap('n', '<leader>lp', ':LivedownToggle<CR>', {})

-- sideways
vim.api.nvim_set_keymap('n', '<S-h>', ':SidewaysLeft<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':SidewaysRight<CR>', { noremap = true })
