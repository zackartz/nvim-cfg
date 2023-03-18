---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "gruvbox_light" },
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "atom_colored",
    icons = true,
  },
  statusline = {
    theme = "minimal",
    separator_style = "block"
  },

  nvdash = {
    load_on_startup = true,
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
