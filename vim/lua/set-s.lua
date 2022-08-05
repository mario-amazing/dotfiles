local set = vim.opt

set.grepprg = "rg --sort=path --column --smart-case --nocolor --follow $*"
set.grepformat = "%f:%l:%c:%m"

set.mouse = 'a'
set.guicursor = 'a:blinkon0' -- disable blinking

set.equalalways = false -- max size for the active window by default
set.winheight = 999 -- Minimal number of lines for the current window.
set.linebreak = true -- wrap by a word

set.showcmd = false -- show command you entering at the bottom

set.expandtab = true -- converting tabs to spaces
set.ignorecase = true -- search(/) without case

set.number = true -- line numbers

set.spelllang='ru_yo,en_us' -- languages words will be recognized

set.ts = 2
set.sw = 2
set.sts = 2

set.list = true
set.listchars = "tab:▷ ,trail:·"

set.scrolloff = 1

set.backupdir = vim.env.HOME.."/.config/nvim/tmp/backup//"  -- backups
set.backup = true
set.swapfile = false

set.hidden = false -- When off a buffer is unloaded (including loss of undo information) when it is abandoned.

set.wildignore = set.wildignore + '.git,.svn' -- ignored when expanding wildcards, completing file or directory names
set.wildignore = set.wildignore + 'vendor/*'

set.formatoptions = set.formatoptions + 'r' -- Insert comment while hitting ENTER in insert mode
set.formatoptions = set.formatoptions + 'o' -- insert comment while hitting O or o

set.splitbelow = true
set.splitright = true
set.diffopt = set.diffopt + 'vertical'

set.clipboard = 'unnamed'

set.virtualedit = 'onemore'
set.conceallevel = 1

set.previewheight = 20

set.confirm = true

set.conceallevel = 0 -- disable hiding " in json file

set.smartcase = true
set.tagbsearch = false

-- vim-gutentags
set.tags = set.tags + 'tags,.git/tags'

-- nvim-cmp
set.completeopt = { 'menu', 'menuone', 'noselect' }
