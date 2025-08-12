-- File name: osx.lua
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

  if require("xcodebuild") then
    whichkey.add({
      { "<leader>X", name = "Xcodebuild" },
    })

    vim.keymap.set("n", "<leader>Xx", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
    vim.keymap.set("n", "<leader>Xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })

    vim.keymap.set("n", "<leader>Xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
    vim.keymap.set("n", "<leader>XB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
    vim.keymap.set("n", "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })

    vim.keymap.set("n", "<leader>Xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
    vim.keymap.set("v", "<leader>Xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
    vim.keymap.set("n", "<leader>XT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" })
    vim.keymap.set("n", "<leader>X.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" })

    vim.keymap.set("n", "<leader>Xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
    vim.keymap.set("n", "<leader>Xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
    vim.keymap.set(
      "n",
      "<leader>XC",
      "<cmd>XcodebuildShowCodeCoverageReport<cr>",
      { desc = "Show Code Coverage Report" }
    )
    vim.keymap.set("n", "<leader>Xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
    vim.keymap.set("n", "<leader>Xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })

    vim.keymap.set("n", "<leader>Xp", "<cmd>XcodebuildPreviewGenerateAndShow<cr>", { desc = "Generate Preview" })
    vim.keymap.set("n", "<leader>X<cr>", "<cmd>XcodebuildPreviewToggle<cr>", { desc = "Toggle Preview" })

    vim.keymap.set("n", "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
    vim.keymap.set("n", "<leader>Xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

    vim.keymap.set("n", "<leader>XX", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
    vim.keymap.set("n", "<leader>Xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })
  end

  local xcodebuild_dap = require("xcodebuild.integrations.dap")
  if xcodebuild_dap then
    whichkey.add({
      { "<leader>dx", name = "Xcodebuild Debug" },
    })

    vim.keymap.set("n", "<leader>dxd", xcodebuild_dap.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dxr", xcodebuild_dap.debug_without_build, { desc = "Debug Without Building" })
    vim.keymap.set("n", "<leader>dxt", xcodebuild_dap.debug_tests, { desc = "Debug Tests" })
    vim.keymap.set("n", "<leader>dxT", xcodebuild_dap.debug_class_tests, { desc = "Debug Class Tests" })
    vim.keymap.set("n", "<leader>dxb", xcodebuild_dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dxB", xcodebuild_dap.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
    vim.keymap.set("n", "<leader>dxx", xcodebuild_dap.terminate_session, { desc = "Terminate Debugger" })
  end
end

return M
