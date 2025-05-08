local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { 'nvimdev/lspsaga.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' } }, -- UI for lsp
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "saghen/blink.cmp" },
  },
}

function M.on_attach(client, bufnr)
  -- LSP
  --map('n', '<space>=',  vim.lsp.buf.formatting, { silent = true })
  vim.keymap.set('n', 'gd',        '<cmd>Telescop lsp_definitions<cr>', { silent = true })
  vim.keymap.set('n', 'gr',        '<cmd>Telescop lsp_references<cr>', { silent = true })
  vim.keymap.set('n', '<space>y',  '<cmd>Telescop lsp_document_symbols<cr>', { silent = true })
  vim.keymap.set('n', '<space>i',  '<cmd>Telescop lsp_incoming_calls<cr>', { silent = true })
  vim.keymap.set('n', '<space>o',  '<cmd>Telescop lsp_outgoing_calls<cr>', { silent = true })
  vim.keymap.set('n', '<space>da', '<cmd>Telescop diagnostics<cr>', { silent = true })
  -- lspsaga.nvim
  vim.keymap.set('n', '<space>dt', ToggleDiagnostics, {silent = true})
  vim.keymap.set('n', '<space>dl', "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
  vim.keymap.set('n', '<space>n',  "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  vim.keymap.set('n', '<space>p',  "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  vim.keymap.set("n", '<space>a',  "<cmd>Lspsaga code_action<CR>", { silent = true })
  vim.keymap.set('n', '<space>h',  "<cmd>Lspsaga hover_doc<CR>", {silent = true})
  vim.keymap.set('n', '<space>r',  "<cmd>Lspsaga rename<CR>", {silent = true})
  vim.keymap.set('n', '<space>f',  "<cmd>Lspsaga lsp_finder<CR>", {silent = true})
  vim.keymap.set('n', '<space>e',  "<cmd>Lspsaga peek_definition<CR>", {silent = true})
end

function M.config()
  -- :LspInfo # check lsp instalation in file
  -- NOTE lsp log file -> :LspLog
  -- vim.lsp.set_log_level("error")
  vim.lsp.set_log_level("off")

  -- Diagnostics symbols for display in the sign column.
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- lspsaga.nvim
  require('lspsaga').setup({
    symbol_in_winbar = { enable = false },
    ui = { colors = { normal_bg = '#1a1a14' } }
  })
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "html", "ts_ls", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "tailwindcss", "astro", "pyright", "emmet_language_server" },
    -- automatic_installation = { exclude = { "solargraph" } }
  })

  local lspconfig = require("lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }

  require'lspconfig'.html.setup {
    filetypes = {"html", "eruby"},
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.ts_ls.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.solargraph.setup{
    on_attach = M.on_attach,
    capabilities = capabilities,
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
  }
  -- TODO: https://shopify.github.io/ruby-lsp/editors#neovim
  -- require'lspconfig'.ruby_lsp.setup{
  -- on_attach = M.on_attach,
  --   capabilities = capabilities
  -- }
  require'lspconfig'.pyright.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.cssls.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.dockerls.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.jsonls.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.yamlls.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.vimls.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.astro.setup{
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.tailwindcss.setup{
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
    },
    on_attach = M.on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.emmet_language_server.setup({
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
    on_attach = M.on_attach,
    capabilities = capabilities,
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
  })

  -- vim.diagnostic.disable()
  function DiagnosticConfig(value)
    return {
      virtual_text = value,
      signs = value,
      update_in_insert = value,
      underline = value,
      severity_sort = value,
      float = value,
    }
  end
  -- ToggleDiagnostics LSP
  local diagnostics_active = false
  vim.diagnostic.config(DiagnosticConfig(diagnostics_active))
  function ToggleDiagnostics()
    diagnostics_active = not diagnostics_active
    vim.diagnostic.config(DiagnosticConfig(diagnostics_active))
    print('Diagnostic active:', diagnostics_active)
  end
  -- ToggleDiagnostics LSP
end

return M
