-- TODO fix vsnip
-- TODO fix mapping
-- Fix telescop autocompletion

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local luasnip = require("luasnip")
local lspkind = require'lspkind'

cmp.setup({
  enabled = function()
    local context = require 'cmp.config.context'
    -- disable completion in comments
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end,
  completion = { keyword_length = 2 }, -- characters needed to trigger auto-completion.
  performance = {
    debounce = 80, -- default 60
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),

    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-c>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'tags' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'rg' },
  }),

  -- extention lspkind
  formatting = {
    format = lspkind.cmp_format({
      menu = ({
        nvim_lsp   = "[lsp]",
        luasnip    = "[snip]",
        tags       = "[tags]",
        buffer     = "[buff]",
        path       = "[path]",
        rg         = "[rg]",
      })
    })
  },
})

local cmp_view = { entries = { name = 'wildmenu', separator = ' ' } }
local cmp_mapping = cmp.mapping.preset.cmdline()

cmp.setup.cmdline('/', {
  view = cmp_view,
  mapping = cmp_mapping,
  sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
  view = cmp_view,
  mapping = cmp_mapping,
  sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
})
