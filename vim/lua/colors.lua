-- https://github.com/ellisonleao/gruvbox.nvim

require("gruvbox").setup({
    palette_overrides = {
      light1 = "#d5c4a1",
      bright_red = "#ea6962",
      bright_green = "#a9b665",
      bright_yellow = "#d8a657",
      bright_blue = "#83a598",
      bright_purple = "#d3869b",
      bright_aqua = "#89b482",
      bright_orange = "#e78a4e",
    },
    bold = false,
    overrides = {
      Function = { link = "GruvboxAquaBold" },
    }
})
vim.cmd([[colorscheme gruvbox]])
