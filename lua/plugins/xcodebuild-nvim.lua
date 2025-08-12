-- File name: xcodebuild-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local plugin = {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    -- "folke/snacks.nvim", -- (optional) to show previews
  },
  config = function()
    local xcodebuild = require("xcodebuild")

    xcodebuild.setup({
      integrations = {
        pymobiledevice = {
          enabled = true,
        },
        xcodebuild_offline = {
          enabled = true,
        },
      },
    })
  end,
}

-- we only want this plugin loaded on OSX targets
if jit.os == "OSX" then
  return plugin
else
  return {}
end
