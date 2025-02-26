-- https://github.com/ellisonleao/gruvbox.nvim

-- Colorscheme
------------------------------
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
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
        -- inverse = false,
        -- invert_selection = true,
        -- bold = true,
        overrides = {
          Function = { link = "GruvboxAquaBold" },
          CmpItemAbbrMatch = { link = "GruvboxOrange" }, -- TODO remove line after fix  https://github.com/hrsh7th/nvim-cmp/issues/1152
          NvimTreeSymlink = { link = "GruvboxBlue" },
          NvimTreeFolderName = { link = "GruvboxGreen" },
          NvimTreeRootFolder = { link = "GruvboxPurple" },
          NvimTreeFolderIcon = { link = "GruvboxOrange" },
          NvimTreeExecFile = { link = "GruvboxYellow" },
          NvimTreeSpecialFile = { link = "GruvboxFg1" },
          NvimTreeIndentMarker = { link = "GruvboxGray" },
        }
      })
      vim.cmd([[colorscheme gruvbox]])
    end,
  }
}
