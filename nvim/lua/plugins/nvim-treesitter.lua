return {
  {
    "nvim-treesitter/nvim-treesitter",  -- highlight syntax
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "andymass/vim-matchup"
    },
    config = function()
      vim.opt.foldmethod = 'manual'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.opt.foldenable = false -- Disable folding at startup.

      require('nvim-treesitter.configs').setup {
        highlight = { enable = true },
        indent = { enable = true }, -- alternative vim.lsp.buf.formatting
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        ensure_installed = { "ruby", 'vim', "lua", 'dockerfile', 'html', 'json', "javascript", "typescript", 'tsx', "css", "scss", "regex", "yaml", "bash", "astro", "markdown", "markdown_inline", "python", "nginx" },

        -- extension vim-matchup
        matchup = { enable = true, disable_virtual_text = true },
      }
    end
  }
}
