-- TODO fix tsx file speed https://github.com/quangnguyen30192/cmp-nvim-tags/issues/7

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local luasnip = require("luasnip")
local lspkind = require'lspkind'
local max_item_count = 4

cmp.setup({
  enabled = function()
    local context = require 'cmp.config.context'
    -- disable completion in comments
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end,
  completion = { keyword_length = 3 }, -- characters needed to trigger auto-completion. For manual trigger <C-c>
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
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.confirm({ select = true })
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),
    ['<C-c>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
  },
  sources = cmp.config.sources({
    { name = 'luasnip', max_item_count = max_item_count },
    { name = 'nvim_lsp', max_item_count = max_item_count  },
    { name = 'tags', max_item_count = max_item_count  },
    { name = 'buffer', max_item_count = max_item_count  },
    { name = 'path', max_item_count = max_item_count },
    { name = 'rg', max_item_count = max_item_count },
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
local cmp_completion = { keyword_length = 1 }

cmp.setup.cmdline('/', {
  view = cmp_view,
  completion = cmp_completion,
  mapping = cmp_mapping,
  sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
  view = cmp_view,
  completion = cmp_completion,
  mapping = cmp_mapping,
  sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
})


cmp.setup.filetype({'TelescopePrompt'}, { enabled = false })
