-- easymotion(s/S) + f{char} improved
return {
  {
    "ggandor/lightspeed.nvim", -- manage sessions
    config = function()
      require('lightspeed').setup {
        ignore_case = true,
        repeat_ft_with_target_char = true,
      }

      vim.g.lightspeed_no_default_keymaps = true

      vim.keymap.set('n', 'gs', '<Plug>Lightspeed_s', { silent = true })
      vim.keymap.set('n', 'gS', '<Plug>Lightspeed_S', { silent = true })
      vim.keymap.set('n', 'f',  '<Plug>Lightspeed_f', { silent = true })
      vim.keymap.set('n', 'F',  '<Plug>Lightspeed_F', { silent = true })
    end
  }
}
