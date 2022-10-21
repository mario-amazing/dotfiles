-- :LspInfo # check lsp instalation in file
-- NOTE lsp log file -> ~/.cache/nvim/lsp.log
-- vim.lsp.set_log_level("error")
vim.lsp.set_log_level("off")

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- lspsaga.nvim
require('lspsaga').init_lsp_saga({ finder_action_keys = { open = "<CR>" }})
-- mason.nvim
require("mason").setup()
-- mason-lspconfig.nvim  -- auto install lsp
-- NOTE , "solargraph" -manual install
require("mason-lspconfig").setup({
  -- ensure_installed = { "html", "tsserver", "solargraph", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "prettierd" }
  ensure_installed = { "html", "tsserver", "cssls", "dockerls", "jsonls", "yamlls", "vimls" }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- NOTE html lsp could raise error when html file has js code
require'lspconfig'.html.setup {
  filetypes = {"html", "eruby"},
  capabilities = capabilities
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}
require'lspconfig'.solargraph.setup{
  capabilities = capabilities
}
require'lspconfig'.cssls.setup{
  capabilities = capabilities
}
require'lspconfig'.dockerls.setup{
  capabilities = capabilities
}
require'lspconfig'.jsonls.setup{
  capabilities = capabilities
}
require'lspconfig'.yamlls.setup{
  capabilities = capabilities
}

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


-- -- NOTE example lsp config
-- require'lspconfig'.solargraph.setup{
--   settings = {
--     solargraph = {
--       diagnostics = true,
--       completion = false,
--       formatting = false,
--     },
--   },
-- }
