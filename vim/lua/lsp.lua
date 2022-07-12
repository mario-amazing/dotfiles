-- :LspInfo # check lsp instalation in file
-- NOTE lsp log file -> ~/.cache/nvim/lsp.log
vim.lsp.set_log_level("error")

-- TODO completion
require'lspconfig'.solargraph.setup{
  settings = {
    solargraph = {
      diagnostics = true,
      completion = false,
      formatting = false,
    },
  },
}

-- linter visual config
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = false,
})
