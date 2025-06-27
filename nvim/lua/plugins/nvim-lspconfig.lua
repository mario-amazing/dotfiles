local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { 'nvimdev/lspsaga.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' } }, -- UI for lsp
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "saghen/blink.cmp" },
  },
  config = function()
    -- :LspInfo # check lsp instalation in file
    -- NOTE lsp log file -> :LspLog
    -- vim.lsp.set_log_level("error")
    vim.lsp.set_log_level("off")

    local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    -- Diagnostics symbols for display in the sign column.
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    require('lspsaga').setup({
      symbol_in_winbar = { enable = false },
      ui = { colors = { normal_bg = '#1a1a14' } }
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "html", "ts_ls", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "tailwindcss", "astro", "pyright", "emmet_language_server", "solargraph" },
      -- automatic_installation = { exclude = { "solargraph" } }
    })

    local function on_attach(client, bufnr)
      vim.keymap.set('n', 'gd',        '<cmd>Telescope lsp_definitions<cr>', { buffer = bufnr })
      vim.keymap.set('n', 'gr',        '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<space>y',  '<cmd>Telescope lsp_document_symbols<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<space>i',  '<cmd>Telescope lsp_incoming_calls<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<space>o',  '<cmd>Telescope lsp_outgoing_calls<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<space>da', '<cmd>Telescope diagnostics<cr>', { buffer = bufnr })

      vim.keymap.set('n', '<space>dt', ToggleDiagnostics, { buffer = bufnr })
      vim.keymap.set('n', '<space>dl', "<cmd>Lspsaga show_line_diagnostics<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>n',  "<cmd>Lspsaga diagnostic_jump_next<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>p',  "<cmd>Lspsaga diagnostic_jump_prev<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>a',  "<cmd>Lspsaga code_action<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>h',  "<cmd>Lspsaga hover_doc<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>r',  "<cmd>Lspsaga rename<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>f',  "<cmd>Lspsaga lsp_finder<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<space>e',  "<cmd>Lspsaga peek_definition<CR>", { buffer = bufnr })
    end

    -- Define once
    local lsp_opts = {
      on_attach = on_attach,
      capabilities = capabilities
    }

    vim.lsp.config('html', vim.tbl_deep_extend("force", {
      filetypes = {"html", "eruby"},
    }, lsp_opts))

    vim.lsp.config('ts_ls', lsp_opts) -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
    vim.lsp.config('solargraph', vim.tbl_deep_extend("force", {
      settings = {
        solargraph = {
          useBundler = true,
          diagnostic = true,
          completion = true,
          hover = true,
          formatting = true,
          symbols = true,
          definitions = true,
          rename = true,
          references = true,
          folding = true
        }
      }
    }, lsp_opts))

    vim.lsp.config('pyright', lsp_opts)
    vim.lsp.config('cssls', lsp_opts)
    vim.lsp.config('dockerls', lsp_opts)
    vim.lsp.config('jsonls', lsp_opts)
    vim.lsp.config('yamlls', lsp_opts)
    vim.lsp.config('vimls', lsp_opts)
    vim.lsp.config('astro', lsp_opts)

    vim.lsp.config('tailwindcss', vim.tbl_deep_extend("force", {
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              "tw`([^`]*)",
              "tw=\"([^\"]*)",
              "tw={\"([^\"}]*)",
              "tw\\.\\w+`([^`]*)",
              "tw\\(.*?\\)`([^`]*)",
              { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              { "classnames\\(([^)]*)\\)", "'([^']*)'" }
            }
          }
        }
      }
    }, lsp_opts))

    vim.lsp.config('emmet_language_server', vim.tbl_deep_extend("force", {
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
      init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
      },
    }, lsp_opts))

    -- Diagnostic toggler
    local diagnostics_active = false
    function ToggleDiagnostics()
      diagnostics_active = not diagnostics_active
      vim.diagnostic.config({
        virtual_text = diagnostics_active,
        signs = diagnostics_active,
        update_in_insert = diagnostics_active,
        underline = diagnostics_active,
        severity_sort = diagnostics_active,
        float = diagnostics_active,
      })
      print('Diagnostic active:', diagnostics_active)
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = false,
      update_in_insert = false,
      underline = false,
      severity_sort = false,
      float = false,
    })
  end
}

return M
