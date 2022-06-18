local map = vim.keymap.set
-- git
map('', '<Leader>gg',  ':Git<space>')
map('', '<Leader>gs',  '<cmd>Gtabedit :<CR>', { silent = true })
map('', '<Leader>gc',  '<cmd>Git commit<CR>', { silent = true })
map('', '<Leader>gp',  '<cmd>Git push<CR>', { silent = true })
map('', '<Leader>gd',  '<cmd>Gitsigns diffthis<CR> ', { silent = true })
map('', '<Leader>gl',  '<cmd>Telescope git_commits<CR>', { silent = true })
map('', '<leader>gb',  '<cmd>Git blame<CR> ', { silent = true })
map('', '<leader>gh',  '<cmd>Telescope git_stash<CR>', { silent = true })
map('', '<leader>gb',  '<cmd>NvimTreeClose<cr><cmd>Git blame<cr> ', { silent = true })
map('', '<Leader>gfl', '<cmd>Telescope git_bcommits<CR> ', { silent = true }) -- logs current file
map('', '<Leader>dp',  '<cmd>diffput<CR> ', { silent = true })

-- SmartGF
map('n', 'gf', ':<C-u>call SmartGF()<CR>', { silent = true })
map('x', 'gf', ':<C-u>call SmartGF()<CR>gv', { silent = true })
map('n', 'gn', ':tnext<CR>', { silent = true })
map('x', 'gn', ':tnext<CR>', { silent = true })

-- move.nvim
map('n', '<A-j>', '<cmd>MoveLine(1)<CR>', { silent = true })
map('n', '<A-k>', '<cmd>MoveLine(-1)<CR>', { silent = true })
map('v', '<A-j>', '<cmd>MoveBlock(1)<CR>', { silent = true })
map('v', '<A-k>', '<cmd>MoveBlock(-1)<CR>', { silent = true })
map('n', '<A-l>', '<cmd>MoveHChar(1)<CR>', { silent = true })
map('n', '<A-h>', '<cmd>MoveHChar(-1)<CR>', { silent = true })
map('v', '<A-l>', '<cmd>MoveHBlock(1)<CR>', { silent = true })
map('v', '<A-h>', '<cmd>MoveHBlock(-1)<CR>', { silent = true })

-- vim-surround
map('v', '"',  '<Plug>VSurround"')
map('v', "'",  "<Plug>VSurround'")
map('n', 'd"', '<Plug>Dsurround"')
map('n', 'dt', '<Plug>Dsurroundt')
map('n', "d'", "<Plug>Dsurround'")

-- Bookmarks
map('n', '<Space><Space>', '<Plug>BookmarkToggle')
map('n', '<Space>i',       '<Plug>BookmarkAnnotate')
map('n', '<Space>a',       '<cmd>Telescope vim_bookmarks all<CR>')
map('n', '<Space>j',       '<Plug>BookmarkNext')
map('n', '<Space>k',       '<Plug>BookmarkPrev')

-- Navigation nvim-tree
map('n', '<Leader>t',  '<cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<Leader>ft', '<cmd>NvimTreeFindFile<CR>', { silent = true })

-- Telescope
map('n', '<C-p>',      '<cmd>Telescope find_files<CR>')
map('n', '<C-f><C-m>', '<cmd>Telescope oldfiles<cr>')
map('n', '<C-f><C-t>', '<cmd>Telescope filetypes<CR>')
map('n', '<Leader>mc', '<cmd>Telescope find_files cwd=~/.config/nvim/lua<CR>')
-- LSP
map('n', 'gd',       '<cmd>Telescop lsp_definitions<cr>', { silent = true })
map('n', 'gr',       '<cmd>Telescop lsp_references<cr>', { silent = true })
map('n', '<space>e', '<cmd>Telescop diagnostics<cr>', { silent = true })

-- Search by asterisk(*)
map('n', 'n',    'nzz')
map('n', 'N',    'Nzz')
map('',  '*',    '<Plug>(asterisk-gz*)', { silent = true })
map('n', '<CR>', '<cmd>nohl<CR><cmd><Esc>')

-- nvim-colorizer
map('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { silent = true})

-- undoquit.vim
map('n', '<C-w>u', '<cmd>Undoquit', { silent = true})

-- lightspeed
map('n', 'gs', '<Plug>Lightspeed_s', { silent = true })
map('n', 'gS', '<Plug>Lightspeed_S', { silent = true })
map('n', 'f',  '<Plug>Lightspeed_f', { silent = true })
map('n', 'F',  '<Plug>Lightspeed_F', { silent = true })

-- Breakpoints
map('n', '<F5>',      '<cmd>lua RemoveBreakpoints()<CR>', {silent = true })
map('n', '<leader>b', '<cmd>lua ToggleBreakpoint()<CR>', { silent = true})

-- shime/vim-livedown
map('n', '<leader>lp', '<cmd>LivedownToggle<CR>')

-- sideways
map('n', '<S-h>', '<cmd>SidewaysLeft<CR>')
map('n', '<S-l>', '<cmd>SidewaysRight<CR>')

-- CamelCaseMotion
map('', '<S-W>', '<Plug>CamelCaseMotion_w')
map('', '<S-B>', '<Plug>CamelCaseMotion_b')
map('', '<S-E>', '<Plug>CamelCaseMotion_e')

-- sandwich
map('x', 'S#', '<Plug>(operator-sandwich-add)i#{<cr>}<cr>')

-- vim-expand-region
map('v', 'v',     '<Plug>(expand_region_expand)')
map('v', '<C-v>', '<Plug>(expand_region_shrink)')

-- vim-commentary
map('v', 'c',  '<Plug>Commentary')

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


-- Common
-- NOTE xnoremap p pgvy -- Not override clipboard on paste (currently fixed/overrides with vim-pasta)
-- Misc
map('n', '<S-q>', '<cmd>q<CR>', { silent = true})
map('n', '<C-s>', '<cmd>write<CR>')
map({'n', 'i'}, '<C-c>', '<Esc>', { silent = true })
map('i', '<C-d>', '<Delete>')
map('n', '<S-u>', '<cmd>redo<CR>')
-- TODO add https://github.com/voldikss/vim-floaterm :term pry !!!!!!!!!!
map('t', '<Esc><Esc>', '<C-\\><C-n>')
-- scroll moves
map('n', 'j',     'gj')          -- scroll by long line
map('n', 'k',     'gk')
map('n', '<C-y>', '2<C-y>')  -- Scroll screen up
map('n', '<C-e>', '2<C-e>')  -- Scroll screen down
map('n', '<C-i>', '<C-i>zz', { silent = true })
map('n', '<C-o>', '<C-o>zz', { silent = true })
-- markup
map('n', '<F8>', '<cmd>let w:v=winsaveview()<cr>ggVG=<cmd>call winrestview(w:v)<cr>', { silent = true })
map('n', 'i', 'IndentWithI()', { expr = true})
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
-- substitute
map('n', '<Leader>f<S-s>', '<cmd>%S/')
map('v', '<Leader>f<S-s>', '<cmd>S/')
map('n', '<Leader>fs', '<cmd>OverCommandLine<CR>%s/', { silent = true })
map('v', '<Leader>fs', '<cmd>OverCommandLine<CR>s/',  { silent = true })
-- name of file
map('n', 'yn', "<cmd>let @+ = substitute(expand('%'), '^'.getcwd().'/', '', '')<CR>")
map('n', 'yN', '<cmd>let @+ = expand("%:t")<CR>')

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
--markup
vim.cmd('cabbrev trw :call TrimWhiteSpace()')
--git
vim.cmd('cabbrev ga   Git add')
vim.cmd('cabbrev gc   Git commit -m')
vim.cmd('cabbrev gca  Git commit --amend -m')
vim.cmd('cabbrev gcan Git commit --amend --no-edit<CR>')
vim.cmd('cabbrev gco  Git checkout')
vim.cmd('cabbrev gcof Git checkout "%:p:h"')

-- ru mappings
vim.cmd("map ё `| map й q| map ц w| map у e| map к r| map е t| map н y| map г u| map ш i| map щ o| map з p| map х [| map ъ ]")
vim.cmd("map ф a| map ы s| map в d| map а f| map п g| map р h| map о j| map л k| map д l| map ж ;| map э '| map я z| map ч x")
vim.cmd("map с c| map м v| map и b| map т n| map ь m| map б ,| map ю .|")
vim.cmd('map Ё ~| map Й Q| map Ц W| map У E| map К R| map Е T| map Н Y| map Г U| map Ш I| map Щ O| map З P| map Х {| map Ъ }')
vim.cmd('map Ф A| map Ы S| map В D| map А F| map П G| map Р H| map О J| map Л K| map Д L| map Ж :| map Э "| map Я Z| map Ч X')
vim.cmd('map С C| map М V| map И B| map Т N| map Ь M| map Б <| map Ю >')
