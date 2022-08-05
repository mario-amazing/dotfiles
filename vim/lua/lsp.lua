-- :LspInfo # check lsp instalation in file
-- NOTE lsp log file -> ~/.cache/nvim/lsp.log
vim.lsp.set_log_level("error")

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Enable completion triggered by <c-x><c-o>
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

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

-- -- linter visual config
-- vim.diagnostic.config({
--   underline = false,
--   virtual_text = false,
--   signs = false,
-- })
