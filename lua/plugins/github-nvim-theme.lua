--[[
-- File name: github-nvim-theme.lua
-- Author: Samuel Boyden
-- Date created: 2025-07-29
-- Date modified: 2025-08-10
-- All rights reserved.
--]]

return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local opts = {
        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      }

      require("github-theme").setup({ options = opts })

      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
