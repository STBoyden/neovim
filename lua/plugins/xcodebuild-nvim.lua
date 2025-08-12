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
    -- "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
  },
  config = function()
    require("xcodebuild").setup({
      -- put some options here or leave it empty to use default settings
    })
  end,
}

if jit.os == "OSX" then
  return plugin
else
  return {}
end
