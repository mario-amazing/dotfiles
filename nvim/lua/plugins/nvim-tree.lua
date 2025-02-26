return {
  {
    "kyazdani42/nvim-tree.lua", -- file manager
    lazy = false,
    config = function()
      local nvimTree_full_size_toggled = false
      function toggle_full_width()
        if nvimTree_full_size_toggled then
          require'nvim-tree.view'.resize(30)
        else
          require'nvim-tree.view'.resize(100)
        end
        nvimTree_full_size_toggled = not nvimTree_full_size_toggled
      end

      function on_attach_nvim_tree(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        -- Mappings removed via:
        -- You might tidy things by removing these along with their default mapping.
        vim.keymap.set('n', '<Tab>', '', { buffer = bufnr })
        vim.keymap.del('n', '<Tab>', { buffer = bufnr })
        vim.keymap.set('n', '<C-t>', '', { buffer = bufnr })
        vim.keymap.del('n', '<C-t>', { buffer = bufnr })


        -- Mappings migrated from view.mappings.list
        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set('n', 'w', api.node.open.preview, opts('Open Preview'))
        vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
        vim.keymap.set('n', '<S-A>', function()
          local node = api.tree.get_node_under_cursor()
          toggle_full_width()
        end, opts('toggle_full_width'))
      end

      require('nvim-tree').setup {
        on_attach = on_attach_nvim_tree,
        update_focused_file = { update_cwd = true },
        filters = { dotfiles = true },
        git = { ignore = false },
        tab = { sync = { open = false, close = true, ignore = {} } },
      }

      vim.keymap.set('n', '<Leader>t',  '<cmd>NvimTreeToggle<CR>', { silent = true })
      vim.keymap.set('n', '<Leader>ft', '<cmd>NvimTreeFindFile<CR>', { silent = true })
    end,
  }
}
