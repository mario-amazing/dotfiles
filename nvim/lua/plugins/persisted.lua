return {
  {
    "olimorris/persisted.nvim", -- manage sessions
    lazy = false,
    config = function()
      vim.keymap.set('n', '<Leader>sl', '<cmd>SessionLoadLast<cr>', { silent = true })
      vim.keymap.set('n', '<Leader>ss', '<cmd>Telescope persisted<cr>', { silent = true })
    end
  }
}
