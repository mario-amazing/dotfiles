-- :LspInfo # check lsp instalation in file
-- :LspInstallInfo # check instaled lcp clients

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
	signs = true,
})
