-- File name: nightfox.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-10
-- Date modified: 2025-08-10
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })

      vim.cmd("colorscheme carbonfox")
    end,
  },
}
