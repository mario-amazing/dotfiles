-- :LspInfo # check lsp instalation in file
-- :LspInstallInfo # check instaled lcp clients
-- NOTE lsp log file -> ~/.cache/nvim/lsp.log

-- TODO add react client
require("nvim-lsp-installer").setup {}
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
