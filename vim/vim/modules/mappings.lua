-- move.nvim
vim.api.nvim_set_keymap('n', '<C-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':MoveHChar(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-l>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-h>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })

-- Bookmarks
vim.api.nvim_set_keymap('n', '<Space><Space>', '<Plug>BookmarkToggle', {})
vim.api.nvim_set_keymap('n', '<Space>i', '<Plug>BookmarkAnnotate', {})
vim.api.nvim_set_keymap('n', '<Space>a', ':Telescope vim_bookmarks all<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>j', '<Plug>BookmarkNext', {})
vim.api.nvim_set_keymap('n', '<Space>k', '<Plug>BookmarkPrev', {})

-- Navigation nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Tagbar
vim.api.nvim_set_keymap('n', '<F2>', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>mc', ':Telescope find_files cwd=~/.vim/modules<CR>', {})

-- Search by asterisk(*)
vim.api.nvim_set_keymap('n', 'n', 'nzz', {})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {})
vim.api.nvim_set_keymap('', '*', '<Plug>(asterisk-z*)', { silent = true})
vim.api.nvim_set_keymap('n', '<CR>', ':nohl<CR>:<Esc>', { noremap = true, silent = true})
