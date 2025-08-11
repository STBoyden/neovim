-- File name: autocmds.lua
-- Author: Samuel Boyden
-- Date created: 2025-06-11
-- Date modified: 2025-08-10
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local copyright_group = "copyright_group"
augroup(copyright_group, { clear = true })

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local header = require("header")
    -- local header_helper = require("config.helpers.header")

    -- local added_header = header_helper and header_helper.add_header_if_not_present(header)
    local added_header = false

    if not added_header and header and header.update_date_modified then
      header.update_date_modified()
    elseif added_header then
      local file_name = vim.fn.expand("%:t")
      vim.notify_once("Header added successfully for " .. file_name, vim.log.levels.INFO)
    else
      vim.notify_once("header.update_date_modified is not available", vim.log.levels.WARN)
    end
  end,
  group = copyright_group,
  desc = "Update header's date modified",
})
