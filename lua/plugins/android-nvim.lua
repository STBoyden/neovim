-- File name: android-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-12
-- Date modified: 2025-08-14
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  "ariedov/android-nvim",
  config = function()
    if jit.os == "OSX" then
      vim.g.android_sdk = "~/Library/Android/sdk"
    elseif jit.os == "Linux" then
      vim.g.android_sdk = "~/Android/Sdk"
    end

    require("android-nvim").setup()
  end,
}
