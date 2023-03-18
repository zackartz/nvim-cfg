---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tc"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
    ["<leader>rl"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "rust hover actions"
    },
    ["<leader>rr"] = {
      function ()
        require('rust-tools').runnables.runnables()
      end,
      "rust runnables"
    },
    ["<leader>re"] = {
      function ()
        require'rust-tools'.expand_macro.expand_macro()
      end,
      "expand rust macro"
    },
    ["<leader>rlr"] = {
      function ()
        require'rust-tools'.hover_range.hover_range()
      end,
      "rust hover range"
    },
    ["<leader>rc"] = {
      function ()
        require'rust-tools'.open_cargo_toml.open_cargo_toml()
      end,
      "open cargo.toml"
    },
    ["<leader>rp"] = {
      function ()
        require'rust-tools'.parent_module.parent_module()
      end,
      "open rust parent module"
    },
    ["<leader>rj"] = {
      function ()
        require'rust-tools'.join_lines.join_lines()
      end,
      "rust join lines"
    }
  },
}

-- more keybinds!

return M
