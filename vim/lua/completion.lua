-- TODO fix vsnip
-- TODO fix mapping
-- TODO config timing before show cmp

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  enabled = function()
    local context = require 'cmp.config.context'
    -- disable completion in comments
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end,
  completion = { keyword_length = 2 }, -- characters needed to trigger auto-completion.
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),

    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
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
        vsnip      = "[snip]",
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
