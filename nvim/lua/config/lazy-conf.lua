local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- emmet-vim
vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_mode='iv' --  modes, in which Emmet mappings will be created(insert/visual)

-- Common
vim.g.mapleader = ','

require("lazy").setup({
  spec = {
    { import = "plugins.colorschemes.gruvbox" },
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false,
  },
  change_detection = {
    notify = false,
  }
  -- performance = {
  --   rtp = {
  --     disabled_plugins = {
  --       "gzip",
  --     },
  --   },
  -- },
  -- checker = { enabled = true },
})
