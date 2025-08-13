-- File name: flote-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-13
-- Date modified: 2025-08-13
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  "Jellyapple102/flote.nvim",
  config = function()
    local flote = require("flote")

    flote.setup({
      files = {
        cwd = function()
          local bufPath = vim.api.nvim_buf_get_name(0)
          local cwd = require("lspconfig").util.root_pattern(".git")(bufPath)

          return cwd
        end,
      },
    })
  end,
}
