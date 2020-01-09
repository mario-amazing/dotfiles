" ,General {{{
if has("gui_running")
  " only text interface
  set guioptions=cM
endif

if executable('rg')
  set grepprg=rg\ --sort=path\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif

set mouse=

set autoread

set nocompatible
set expandtab
set autoindent

set history=10000
set ignorecase
set hls
set incsearch

set noshowcmd  " show command you entering at the bottom
scriptencoding utf-8
set encoding=utf-8

set shell=/bin/bash
" set cursorline

set textwidth=80


set noequalalways " max size for the active window by default
set winheight=9999
set winminheight=0

set linebreak   " wrap by a word
set wrap
" set sidescroll=9000

set dy=lastline

set foldenable
set foldmethod=marker
set foldlevel=9000
set foldcolumn=0
set foldtext=CustomFoldText()
"set foldnestmax=1
set foldminlines=2
"set foldlevelstart=1
"au WinEnter * set foldcolumn=
set lazyredraw
set ttyfast


" scroll and goto more naturally
set nostartofline

set number      " line numbers
"au BufWinEnter * setlocal numberwidth=2
set ts=2 sw=2 sts=2

set timeoutlen=1000 ttimeoutlen=40

set list
" set listchars=tab:▷ ,trail:·,nbsp:⍽
" set listchars=tab:▷ ,trail:·
set listchars=trail:·,tab:\ \ 
" set smartcase
set smarttab

" stop remove my tabs before comments!11
set nosmartindent

set scrolloff=1

"if !isdirectory(backupDirectory) | silent exec '!mkdir -p ' . backupDirectory | endif
set noundofile
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swapfiles
set noswapfile
set backup
"set swapfile
" if has("persistent_undo")
"   set hidden
"   set undodir='~/.vim/tmp/undo'
"   set undofile
" endif

set nohidden

set wildignore+=.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll
set wildignore+=vendor/*
set wildignore+=*.sw?


if v:version > 703 || v:version == 703 && has('patch541')
" Delete comment character when joining commented lines
  set formatoptions+=j
endif
" insert comment while hitting ENTER in insert mode
set formatoptions+=r
" insert comment while hitting O or o
set formatoptions+=o

set splitbelow
set splitright
set diffopt+=vertical

set undolevels=1000
set novisualbell           " don't beep
set noerrorbells         " don't beep

set clipboard=unnamedplus
" set clipboard=unnamed
let colLim = 80

"}}}

" ,Wild menus {{{

set wildmenu
set wcm=<Tab>
menu Settings.paste-toggle       :call toggle_paster_mode()<CR>
menu Settings.mouse-toggle       :call ToggleMouseMode()<CR>
map <F12> :emenu Settings.<Tab>
"}}}

set virtualedit=onemore
set conceallevel=1

set notagbsearch
set viewoptions=cursor


set previewheight=20

set confirm
set tags+=./tmp/tags
set tags+=./.tags
if has('nvim')
  set tagcase=match
endif

if has('nvim')
  " let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
endif

" set background=dark

" setbackground termguicolors
" let g:loaded_ruby_provider = 1 " disable ruby support
