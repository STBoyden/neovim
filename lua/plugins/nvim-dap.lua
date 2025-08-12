-- File name: nvim-dap.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    jit.os == "OSX" and "wojciech-kulik/xcodebuild.nvim" or nil,
  },
  config = function()
    local dap = require("dap")

    if jit.os == "OSX" then
      require("plugins.dap_configs.xcodebuild").setup_dap(dap)
    end
  end,
}
