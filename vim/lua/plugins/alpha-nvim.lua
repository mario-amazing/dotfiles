local alpha = require("alpha")

require("alpha.term")
local dashboard = require("alpha.themes.dashboard")

local header = {
    type = "text",
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
    button("t", "滑  Open tree", ':NvimTreeToggle<CR>'),
    button("n", "   New file", ":ene <BAR> startinsert <CR>"),
    button("p", "   Find file(Ctrl-p)", ":Telescope find_files hidden=true path_display=smart<CR>"),
    button("m", "   MRU", ":Telescope oldfiles<CR>"),
    button("f", "   Find text", "<plug>(esearch)"),
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
