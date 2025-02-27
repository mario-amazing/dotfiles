#### Commands in terminal
`:term pry`

#### Float term
`<A-t>`

#### Next/prev git hunk
```
  <leader>hn Gitsigns next_hunk
  <leader>hp Gitsigns prev_hunk
```

#### Bookmarks https://github.com/MattesGroeger/vim-bookmarks#usage
```
  mm :BookmarkToggle
  mi :BookmarkAnnotate
  ma :BookmarkShowAll
  mc :BookmarkClear
  mx :BookmarkClearAll
  mn :BookmarkNext
  mp :BookmarkPrev
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
<Leader>fs
```

#### Plug 'nat-418/boole.nvim'
```
CTRL-A/CTRL-X to increment dates, times, and more ## same with numbers variables
Sat, 01 Jan 2000 00:16:03 -0001
```

```
#### Plug 'Wansmer/sibling-swap.nvim'
Move an item in a delimiter-separated list left or right(C-,/C-.)
```

#### Plug 'junegunn/vim-easy-align' https://github.com/junegunn/vim-easy-align
```
Text align lines symbols(ga )
```

#### LivePreview markdown - r4mmer/markdown-preview.nvim
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
