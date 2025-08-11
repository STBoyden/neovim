-- File name: header-nvim.lua
-- Author: Samuel Boyden
-- Date created: 2025-08-10
-- Date modified: 2025-08-11
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  {
    "attilarepka/header.nvim",
    -- dir = "~/dev/repos/personal/header.nvim",
    -- dev = true,
    config = function()
      require("header").setup({
        author = "Samuel Boyden",
        date_created_fmt = "%Y-%m-%d",
        date_modified_fmt = "%Y-%m-%d",
        copyright_text = "Copyright (c) " .. os.date("%Y") .. " Samuel Boyden. All rights reserved.",
        use_block_header = false,
        -- license_from_file = true,
      })
    end,
  },
}
