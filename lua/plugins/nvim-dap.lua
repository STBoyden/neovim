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
    if jit.os == "OSX" then
      local dap = require("dap")
      local xcodebuild = require("xcodebuild.integrations.dap")

      local port = "13000"
      local codelldb_path = os.getenv("HOME") .. "/tools/codelldb/extension/adapter/codelldb"

      xcodebuild.setup(codelldb_path)

      dap.adapters.codelldb = {
        type = "server",
        port = port,
        executable = {
          command = codelldb_path,
          args = {
            "--port",
            port,
            "--liblldb",
            "/Applications/Xcode-beta.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
          },
        },
      }

      vim.keymap.set("n", "<leader>dxd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
      vim.keymap.set("n", "<leader>dxr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
      vim.keymap.set("n", "<leader>dxt", xcodebuild.debug_tests, { desc = "Debug Tests" })
      vim.keymap.set("n", "<leader>dxT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
      vim.keymap.set("n", "<leader>dxb", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dxB", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
      vim.keymap.set("n", "<leader>dxx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
    end
  end,
}
