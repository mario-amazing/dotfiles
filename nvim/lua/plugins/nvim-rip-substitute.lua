return {
  "chrisgrieser/nvim-rip-substitute",
  lazy = "VeryLazy",
  keys = {
    {
      "<leader>fs",
      function() require("rip-substitute").sub() end,
      mode = { "n", "x" },
    },
  },
}
