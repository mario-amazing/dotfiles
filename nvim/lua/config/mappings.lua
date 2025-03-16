local map = vim.keymap.set
-- git
map('n', '<leader>lg',  '<cmd>LazyGit<CR>', {silent = false})
map('',  '<Leader>go',  '<cmd>lua require("git.browse").open(false)<CR>', { silent = true }) -- open file on github site
map('',  '<Leader>gg',  ':Git<space>')
map('',  '<leader>gb',  '<cmd>NvimTreeClose<cr><cmd>lua require("git.blame").blame()<cr>', { silent = true })
map('',  '<Leader>dp',  '<cmd>diffput<CR> ', { silent = true })
map('',  '<Leader>gs',  '<cmd>Gtabedit :<CR>', { silent = true }) -- TODO fix after https://github.com/dinhhuy258/git.nvim/issues/8
map('',  '<Leader>gc',  '<cmd>Git commit<CR>', { silent = true })
map('',  '<Leader>gp',  '<cmd>Git push<CR>', { silent = true })
map('',  '<Leader>gd',  '<cmd>Gitsigns diffthis<CR> ', { silent = true })
map('',  '<Leader>gl',  '<cmd>Telescope git_commits<CR>', { silent = true })
map('',  '<leader>gh',  '<cmd>Telescope git_stash<CR>', { silent = true })
map('',  '<Leader>gfl', '<cmd>Telescope git_bcommits<CR> ', { silent = true }) -- logs current file
-- gitsigns
map('n', '<leader>hn',  '<cmd>Gitsigns next_hunk<CR>')
map('n', '<leader>hp',  '<cmd>Gitsigns prev_hunk<CR>')

-- SmartGF
map('n', 'gf', ':<C-u>call SmartGF()<CR>', { silent = true })
map('x', 'gf', ':<C-u>call SmartGF()<CR>gv', { silent = true })
map('n', 'gn', ':tnext<CR>', { silent = true })
map('x', 'gn', ':tnext<CR>', { silent = true })

-- Bookmarks with telescope-vim-bookmarks.nvim
map('n', 'ma', '<cmd>Telescope vim_bookmarks all<CR>')

-- Telescope
map('n', '<C-p>',      '<cmd>Telescope find_files find_command=rg,--hidden,--no-ignore-vcs,--files,--ignore-file,'..vim.fn.expand('~/.config/.ignore')..'<CR>')
-- map('n', '<C-p>',      '<cmd>Telescope find_files find_command=rg,--hidden,--no-ignore-vcs,--files<CR>')
map('n', '<C-f><C-m>', '<cmd>Telescope oldfiles<cr>')
map('n', '<C-f><C-t>', '<cmd>Telescope filetypes<CR>')
map('n', '<C-f><C-g>', '<cmd>Telescope live_grep<CR>')
map('n', '<Leader>mc', '<cmd>Telescope find_files cwd=~/.config/nvim/lua<CR>')

-- sibling-swap.nvim
map("n", "<a-,>", "<cmd>lua require('sibling-swap').swap_with_left()<CR>")
map("n", "<a-.>", "<cmd>lua require('sibling-swap').swap_with_right()<CR>")

-- Search by asterisk(*)
map('n', 'n',    'nzz')
map('n', 'N',    'Nzz')
map('n', '*', function() require("lasterisk").search({ silent = true }) end)
map('x', '*', function() require("lasterisk").search({ is_whole = false, silent = true }) end)
map('n', '<CR>', '<cmd>nohl<CR><cmd><Esc>')

-- nvim-colorizer
map('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { silent = true})

-- Breakpoints
map('n', '<F5>',      RemoveBreakpoints, {silent = true })
map('n', '<leader>b', ToggleBreakpoint, { silent = true})

-- r4mmer/markdown-preview.nvim(preview)
map('n', '<leader>lp', '<Plug>MarkdownPreviewToggle')

-- auto-save.nvim
map('n', '<leader>at', '<cmd>ASToggle<CR>')

-- sandwich
map('x', 'S#', '<Plug>(operator-sandwich-add)i#{<cr>}<cr>')
map('x', 'S%', '<Plug>(operator-sandwich-add)i%{<cr>}<cr>')

-- vim-expand-region
map('v', 'v',     '<Plug>(expand_region_expand)')
map('v', '<C-v>', '<Plug>(expand_region_shrink)')

-- nvim-ts-context-commentstring(<Plug>ContextCommentary run vim-commentary)
map('v', 'c', '<Plug>ContextCommentary')

-- vim-easy-align
map({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)')

-- vim-esearch
map('n', '<C-f><C-f>', '<plug>(esearch)')
map('n', '<C-f>f',     '<plug>(esearch)')
map('n', '<C-f><C-w>', '<plug>(operator-esearch-prefill)iw') -- search word under cursor
map('n', '<C-f>w',     '<plug>(operator-esearch-prefill)iw')

-- vim-yaml-helper
map('n', '<leader>yg', function() return vim.cmd('YamlGoToKey ' .. vim.fn.getreg('*')) end) -- goto key from buffer
map('n', '<leader>yy', '<cmd>YamlGetFullPath<CR>')

-- nvim-surround
map('v', "'",  "S'", { remap = true })
map('v', '"',  'S"', { remap = true })
map('n', "d'", "ds'", { remap = true })
map('n', 'd"', 'ds"', { remap = true })
map('n', 'dt', 'dst', { remap = true })

map('n', '<Leader>fp', '<cmd>FormatWrite<CR>', { silent = true })

-- switch.vim
map('n', "-", ":Switch<CR>", { remap = true })

-- CamelCaseMotion
map('', '<S-W>', '<Plug>CamelCaseMotion_w')
map('', '<S-B>', '<Plug>CamelCaseMotion_b')
map('', '<S-E>', '<Plug>CamelCaseMotion_e')

-- fedepujol/move.nvim
map('n', '<A-j>', ':MoveLine(1)<CR>', { silent = true })
map('n', '<A-k>', ':MoveLine(-1)<CR>', { silent = true })
map('v', '<A-j>', ':MoveBlock(1)<CR>', { silent = true })
map('v', '<A-k>', ':MoveBlock(-1)<CR>', { silent = true })
map('n', '<A-l>', ':MoveWord(1)<CR>', { silent = true })
map('n', '<A-h>', ':MoveWord(-1)<CR>', { silent = true })
map('v', '<A-l>', ':MoveHBlock(1)<CR>', { silent = true })
map('v', '<A-h>', ':MoveHBlock(-1)<CR>', { silent = true })

----------------------- COMMON -----------------------
-- nvim-pasta
map({ 'n', 'x' }, 'p', require('pasta.mapping').p)
map({ 'n', 'x' }, 'P', require('pasta.mapping').P)

-- Misc
map('n', '<S-q>', '<cmd>q<CR>', { silent = true})
map('n', '<leader>q', '<cmd>qa<CR>', { silent = true})
map('n', '<C-s>', '<cmd>write<CR>')
map({'n', 'i'}, '<C-c>', '<Esc>', { silent = true })
map('i', '<C-d>', '<Delete>')
map('n', '<S-u>', "<cmd>redo<CR>")

-- scroll moves
map('n', 'j',     'gj')          -- scroll by long line
map('n', 'k',     'gk')
map('n', '<C-y>', '2<C-y>')  -- Scroll screen up
map('n', '<C-e>', '2<C-e>')  -- Scroll screen down
map('n', '<C-i>', '<C-i>zz', { silent = true })
map('n', '<C-o>', '<C-o>zz', { silent = true })

-- markup
map('n', '<F8>', function() preserveCursor("normal! ggVG=") end , { silent = true }) -- FullFileIndent
map('n', 'i', IndentWithI, { expr = true })
map('n', '<leader>wt', TrimWhiteSpace)
map('n', '<leader>pj', '<cmd>%!jq .<CR>') -- prettify json

-- jump window
map('', '<C-k>', '<C-w><C-k>', { silent = true })
map('', '<C-j>', '<C-w><C-j>', { silent = true })
map('', '<C-l>', '<C-w><C-l>', { silent = true })
map('', '<C-h>', '<C-w><C-h>', { silent = true })

-- tabs
map('n', '<C-t>',   '<cmd>tabnew<CR>', { silent = true })
map('n', '<Tab>',   'gt', { silent = true })
map('n', '<S-Tab>', 'gT', { silent = true })
map('n', 'g1',      '1gt', { silent = true })
map('n', 'g2',      '2gt', { silent = true })
map('n', 'g3',      '3gt', { silent = true })
map('n', 'g4',      '4gt', { silent = true })
map('n', 'g5',      '5gt', { silent = true })
map('n', 'g6',      '6gt', { silent = true })
map('n', 'g7',      '7gt', { silent = true })
map('n', 'g8',      '8gt', { silent = true })
map('n', 'g9',      '9gt', { silent = true })
map('n', 'g0',      '10gt', { silent = true })

-- indentation
map('n', '>', '>>',  { silent = true })
map('n', '<', '<<',  { silent = true })
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })
map('v', '=', '=gv', { silent = true })
map('n', '=', '==',  { silent = true })

-- name of file
map('n', 'yn', "<cmd>let @+ = substitute(expand('%'), '^'.getcwd().'/', '', '')<CR>")
map('n', 'yN', '<cmd>let @+ = expand("%:t")<CR>')
map('n', 'yl', "<cmd>let @+ = join([expand('%'), line('.')], ':')<CR>")

-- #Commandline(after press :)
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')
map('c', '<C-k>', '<Up>')
map('c', '<C-j>', '<down>')
map('c', '<C-b>', '<Left>')
map('c', '<C-f>', '<Right>')
map('c', '<C-d>', '<Delete>')
map('c', '<M-b>', '<S-Left>')
map('c', '<M-f>', '<S-Right>')
map('c', '<M-d>', '<S-right><Delete>')

-- ru mappings
vim.cmd("map ё `| map й q| map ц w| map у e| map к r| map е t| map н y| map г u| map ш i| map щ o| map з p| map х [| map ъ ]")
vim.cmd("map ф a| map ы s| map в d| map а f| map п g| map р h| map о j| map л k| map д l| map ж ;| map э '| map я z| map ч x")
vim.cmd("map с c| map м v| map и b| map т n| map ь m| map б ,| map ю .|")
vim.cmd('map Ё ~| map Й Q| map Ц W| map У E| map К R| map Е T| map Н Y| map Г U| map Ш I| map Щ O| map З P| map Х {| map Ъ }')
vim.cmd('map Ф A| map Ы S| map В D| map А F| map П G| map Р H| map О J| map Л K| map Д L| map Ж :| map Э "| map Я Z| map Ч X')
vim.cmd('map С C| map М V| map И B| map Т N| map Ь M| map Б <| map Ю >')
