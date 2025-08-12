-- File name: android-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  "ariedov/android-nvim",
  config = function()
    vim.g.android_sdk = "~/Android/Sdk"

    require("android-nvim").setup()
  end,
}
