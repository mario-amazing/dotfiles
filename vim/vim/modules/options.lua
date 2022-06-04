local set = vim.opt

set.grepprg = "rg --sort=path --column --smart-case --nocolor --follow $*"
set.grepformat = "%f:%l:%c:%m"

set.mouse = 'a'
set.guicursor = '' -- disable blinking

set.equalalways = false -- max size for the active window by default
set.winheight = 999 -- Minimal number of lines for the current window.
set.linebreak = true -- wrap by a word

set.showcmd = false -- show command you entering at the bottom

set.expandtab = true -- converting tabs to spaces
set.ignorecase = true -- search(/) without case

set.number = true -- line numbers

set.ts = 2
set.sw = 2
set.sts = 2

set.list = true

set.scrolloff = 1

set.backupdir = "~/.vim/tmp/backup//" -- backups
set.directory = "~/.vim/tmp/swap//"   -- swapfiles
set.swapfile = false
set.backup = true

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

set.tagbsearch = false

set.previewheight = 20

set.confirm = true
set.tags = set.tags + './tmp/tags'
set.tags = set.tags + './.tags'
set.tagcase = 'match'
