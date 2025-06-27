-- smart paste, override (p and P)!!!
return {
  {
    "hrsh7th/nvim-pasta",
    event = "VeryLazy",
    config = function()
      require('pasta').config.indent_fix = false
      vim.keymap.set({ 'n', 'x' }, 'p', require('pasta.mapping').p)
      vim.keymap.set({ 'n', 'x' }, 'P', require('pasta.mapping').P)
    end
  }
}
