local alpha = require("alpha")

require("alpha.term")
local dashboard = require("alpha.themes.dashboard")

-- Terminal header
-- dashboard.section.terminal.command = "cat | lolcat --seed=5 ~/.config/nvim/static/startimg.cat"
-- dashboard.section.terminal.width = 27
-- dashboard.section.terminal.height = 10

local header = {
    type = "text",
    -- command = "lolcat --seed=1 -F 0.08 ~/.config/nvim/static/startimg.cat",
    -- height = 10,
    -- width = 27,
    val = {
        [[       T E      E T H E   ]],
        [[      A  Q    F         U ]],
        [[     M   E   I           N]],
        [[    I    S   L          I ]],
        [[   T     T             V  ]],
        [[  L      I           E    ]],
        [[ U       O         R      ]],
        [[EHTOTREWSNA      S        ]],
        [[         O     E          ]],
        [[         F   ANDEVERYTHING]],
    },
    opts = {
      hl = "Orange",
      position = "center",
    },
}

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  -- b.opts.hl = "Number"
  b.opts.hl_shortcut = "Keyword"
  return b
end

local buttons = {
  type = "group",
  val = {
    button("l", "   Load session", ':SessionLoadLast<CR>'),
    button("s", "   Select sessions", ":Telescope persisted<CR>"),
    button("o", "滑  Open tree", ':NvimTreeToggle<CR>'),
    button("n", "   New file", ":ene <BAR> startinsert <CR>"),
    button("f", "   Find file", ":Telescope find_files hidden=true path_display=smart<CR>"),
    button("r", "   Recently used files", ":Telescope oldfiles<CR>"),
    button("t", "   Find text", "<plug>(esearch)"),
    button("u", "   Update plugins", ":PlugUpdate<CR>"),
    button("q", "   Quit Neovim", ":qa!<CR>"),
  },
  opts = {
    spacing = 0,
  }
}

local quote = {
  type = "text",
  val = {
    'Wu wei (Chinese: 無為; pinyin: wúwéi; У-вэй)',
    'is an ancient Chinese concept literally meaning "inexertion", "inaction", or "effortless action"',
  },
  opts = {
    position = "center",
    hl = "Grey",
  },
}

local function footer()
  local version = vim.version()
  return " Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
end

local footer = {
  type = "text",
  val = footer(),
  opts = {
    position = "center",
    -- hl = "Directory",
    hl = "Grey",
  },
}

-- Layout
dashboard.config.layout = {
  { type = "padding", val = 3 },
  header,
  { type = "padding", val = 2 },
  buttons,
  { type = "padding", val = 2 },
  quote,
  { type = "padding", val = 1 },
  footer,
}

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
