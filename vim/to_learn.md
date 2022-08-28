#### Commands in terminal
`:term pry`

#### Float term
`<A-t>`

#### Next/prev git hunk
```
  <leader>hn Gitsigns next_hunk
  <leader>hp Gitsigns prev_hunk
```

#### Bookmarks
```
  nmap <Space><Space> <Plug>BookmarkToggle
  nmap <Space>i <Plug>BookmarkAnnotate
  nmap <Space>s <Plug>BookmarkShowAll
  nmap <Space>j <Plug>BookmarkNext
  nmap <Space>k <Plug>BookmarkPrev
```

#### TrimWhiteSpace in command line
`trw`

#### undoquit.vim -> Undo closed tabs
`<c-w>u restore closed window`

#### Resolve merge conflicts
```
  https://github.com/rhysd/conflict-marker.vim
  ct for theirs, co for ours, cn for none and cb for both
```

#### Visual substitute
```
<Leader>fs :OverCommandLine<CR>%s/
<Leader>fs :OverCommandLine<CR>s/
```

#### Plug 'tpope/vim-speeddating'
```
CTRL-A/CTRL-X to increment dates, times, and more ## same with numbers variables
Sat, 01 Jan 2000 00:16:03 -0001
```

```
#### Plug 'AndrewRadev/sideways.vim'
Move an item in a delimiter-separated list left or right(S-h/S-l)
```

#### Plug 'junegunn/vim-easy-align' https://github.com/junegunn/vim-easy-align
```
Text align lines symbols(ga )
```

#### LivePreview markdown - shime/vim-livedown
```
<Leader>lp - Live privew Toggle README
```

#### wellle/targets.vim - Select inside({['"]})
```
vi( va( vi' va"
```

#### nvim-surround https://github.com/kylechui/nvim-surround#rocket-usage
```
    Old text                    Command         New text
--------------------------------------------------------------------------------
    local str = |some text|     S'              local str = 'some text' (Visual)
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```
