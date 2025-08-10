--[[
-- File name: header-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-10
-- Date modified: 2025-08-10
-- All rights reserved.
--]]

return {
  {
    "attilarepka/header.nvim",
    config = function()
      require("header").setup({
        author = "Samuel Boyden",
        date_created_fmt = "%Y-%m-%d",
        date_modified_fmt = "%Y-%m-%d",
        copyright = "Copyright (c) 2025 Samuel Boyden",
        line_separator = "All rights reserved.",
        -- license_from_file = true,
      })
    end,
  },
}
