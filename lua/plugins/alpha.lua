return {

  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                        ]],
      [[                                                                        ]],
      [[                                                                        ]],
      [[                                                                        ]],
      [[                                                                        ]],
      [[                                                                        ]],
      [[                                                                        ]],
      [[          ╭───────────╮ ╭─╮      ╭─╮ ╭─────────╮  ╭──────────╮          ]],
      [[          │ ╭───────╮ │ │ │      │ │ │ ╭─────╮ │  │ ╭──────╮ │          ]],
      [[          │ │       │ │ │ │      │ │ │ │     │ │  │ │      │ │          ]],
      [[          │ │       │ │ │ │      │ │ │ ╰─────╯ ╰╮ │ │      │ │          ]],
      [[          │ │       │ │ │ │      │ │ │ ╭──────╮ │ │ │      │ │          ]],
      [[          │ │       │ │ │ │      │ │ │ │      │ │ │ │      │ │          ]],
      [[          │ │       │ │ │ ╰──────╯ │ │ ╰──────╯ │ │ ╰──────╯ │          ]],
      [[          ╰─╯       ╰─╯ ╰──────────┘ ╰──────────╯ ╰──────────╯          ]],
      [[                                                                        ]],
      [[                                                                        ]],
      [[                                                                        ]],
    }

    _Gopts = {
      position = "center",
      hl = "Type",
      -- wrap = "overflow";
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  new file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("SPC f f", "󰈞  find file"),
      dashboard.button("SPC f h", "󰊄  recent files"),
      dashboard.button("SPC f g", "󰈬  find word"),
      dashboard.button("SPC f p", "  find project"),
      dashboard.button("SPC s l", "󰛃  session lens"),
      dashboard.button("q", "󰅚  quit", ":qa<CR>"),
    }

    local function footer()
    	return ""
    end

    dashboard.section.footer.val = footer()

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
