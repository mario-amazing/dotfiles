-- Autocomplete
--------------------------------------
return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
    "mikavilpas/blink-ripgrep.nvim",
    -- 'L3MON4D3/LuaSnip', version = 'v2.*', build = "make install_jsregexp"
  },

  version = "*",
  -- config = function() require("luasnip.loaders.from_vscode").lazy_load() end, -- friendly-snippets
  opts = {
    snippets = {
      -- preset = 'luasnip',
      -- Function to use when expanding LSP provided snippets
      expand = function(snippet) vim.snippet.expand(snippet) end,
      -- Function to use when checking if a snippet is active
      active = function(filter) return vim.snippet.active(filter) end,
      -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
      jump = function(direction) vim.snippet.jump(direction) end,
    },

    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = {
      preset = "super-tab",
      ['<C-n>'] = { 'show', 'select_next', 'fallback' },
      ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
    },
    completion = {
      keyword = {
        range = 'full',
      },
      list = {
        selection = { preselect = false, auto_insert = true }
      },
      -- ghost_text = {
      --   enabled = false,
      --   show_with_selection = true,
      -- },
      menu = {
        draw = {
          -- source_id
          columns = { { "label", gap = 1 }, { "kind_icon" }, {"kind" }, {"source_name" } },
        }
      }
    },
    signature = { enabled = true },
    cmdline = {
      enabled = true,
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == '/' or type == '?' then return { 'buffer' } end
        if type == ':' or type == '@' then return { 'cmdline' } end
        return {}
      end,
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer", "ripgrep" },
      providers = {
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {
            prefix_min_len = 2,
            context_size = 5,
            max_filesize = "1M",
            additional_rg_options = {},
          },
        },
      },
    },
  },
  opts_extend = {
    "sources.default",
    "sources.providers",
  },
}
