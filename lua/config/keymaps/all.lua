-- File name: all.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local M = {}

---@param whichkey wk
M.setup_keybinds = function(whichkey)
  if not whichkey then
    return
  end

  local android = require("android-nvim")
  if android then
    whichkey.add({
      { "<leader>A", group = "Android", icon = { icon = "\u{f17b}", color = "green" } },
      { "<leader>Ar", android.build_and_run, desc = "Build & Run Project" },
      { "<leader>AR", android.build_release, desc = "Build (release mode)" },
      { "<leader>Ac", android.clean, desc = "Clean Project" },
      { "<leader>Ap", android.launch_avd, desc = "Pick & Launch AVD" },
      { "<leader>Ad", android.refresh_dependencies, desc = "Refresh Dependencies" },
    })
  end
end

return M
