local overrides = require "custom.configs.overrides"

local utils = require "core.utils"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    enabled = false,
    config = function()
      require("noice").setup {
        cmdline = {
          format = {
            cmdline = {
              pattern = "^:",
              icon = " ",
              lang = "vim",
            },
            search_down = {
              kind = "search",
              pattern = "^/",
              icon = " ",
              lang = "regex",
            },
            search_up = {
              kind = "search",
              pattern = "^/",
              icon = " ",
              lang = "regex",
            },
            filter = {
              pattern = "^:%s*!",
              icon = "$",
              lang = "bash",
            },
            lua = {
              pattern = "^:%s*lua%s+",
              icon = "",
              lang = "lua",
            },
            help = { pattern = "^:%s*h%s+", icon = "" },
            input = {},
          },
        },
        popupmenu = {
          backend = "cmp",
        },
        views = {
          cmdline_popup = {
            position = {
              row = 0,
              col = "50%",
            },
            size = {
              width = "98%",
            },
            border = {
              style = "none",
              padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
      }
    end,
    lazy = false,
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require "rust-tools"

      rt.setup {
        hover_actions = {
          auto_focus = true,
        },
        server = {
          on_attach = function (_, bufnr)
            utils.load_mappings("lspconfig", { buffer = bufnr })
          end
        }
      }
      rt.inlay_hints.enable()
    end,
    lazy = false,
  },

  "nvim-lua/plenary.nvim",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
  },
}

return plugins
