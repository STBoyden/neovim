-- File name: flote-sync-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-13
-- Date modified: 2025-08-14
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local dev_dir = vim.fn.expand("~/dev/repos/personal/flote-sync.nvim")
local M = {}

if vim.uv.fs_stat(dev_dir) then
  M = {
    dir = dev_dir,
    dev = true,
    dependencies = {
      "Jellyapple102/flote.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local flote_sync = require("flote-sync")

      flote_sync.setup({})
    end,
  }
end

return M
