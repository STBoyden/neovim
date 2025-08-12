-- File name: xcodebuild.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local M = {}

M.setup_dap = function(dap)
  local xcodebuild = require("xcodebuild.integrations.dap")
  if not xcodebuild then
    return
  end

  local port = "13000"
  local codelldb_path = os.getenv("HOME") .. "/tools/codelldb/extension/adapter/codelldb"

  xcodebuild.setup(codelldb_path)

  local is_xcode_beta = true
  local xcode_app = is_xcode_beta and "/Applications/Xcode-beta.app" or "/Applications/Xcode.app"

  dap.adapters.codelldb = {
    type = "server",
    port = port,
    executable = {
      command = codelldb_path,
      args = {
        "--port",
        port,
        "--liblldb",
        xcode_app .. "/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
      },
    },
  }
end

return M
