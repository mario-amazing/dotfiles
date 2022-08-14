-- :LspInfo # check lsp instalation in file
-- NOTE lsp log file -> ~/.cache/nvim/lsp.log
vim.lsp.set_log_level("error")

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- mason.nvim
require("mason").setup()
-- mason-lspconfig.nvim  -- auto install lsp
-- , "solargraph" -manual install
require("mason-lspconfig").setup({
  -- ensure_installed = { "html", "tsserver", "solargraph", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "prettierd" }
  ensure_installed = { "html", "tsserver", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "prettierd" }
})


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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


-- ToggleDiagnostics LSP
vim.diagnostic.disable()
local diagnostics_active = false
function ToggleDiagnostics()
  if diagnostics_active then
    vim.diagnostic.disable()
  else
    vim.diagnostic.enable()
  end
  diagnostics_active = not diagnostics_active
end
-- ToggleDiagnostics LSP


-- -- TODO completion
-- require'lspconfig'.solargraph.setup{
--   settings = {
--     solargraph = {
--       diagnostics = true,
--       completion = false,
--       formatting = false,
--     },
--   },
-- }
