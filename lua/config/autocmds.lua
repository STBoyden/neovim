-- File name: autocmds.lua
-- Author: Samuel Boyden
-- Date created: 2025-06-11
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local copyright_group = "copyright_group"
augroup(copyright_group, { clear = true })

autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*",
  callback = function()
    local header = require("header")
    if not header then
      vim.notify_once(
        "Could not automatically add header to new file: header module couldn't be found",
        vim.log.levels.ERROR
      )
      return
    end

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local is_empty = #lines == 1 and lines[1] == ""

    if header.config.allow_autocmds and is_empty then
      local original_fmt = header.config.date_created_fmt
      local now = os.date(header.config.date_created_fmt, os.time())

      -- force add_headers to use the current datetime, otherwise it will show 1970-01-01
      header.config.date_created_fmt = now
      header.add_headers()

      header.config.date_created_fmt = original_fmt -- restore the original format
    end
  end,
  group = copyright_group,
  desc = "Add copyright header to new files",
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local header = require("header")
    local filetype_table = require("filetypes")

    local file_extension = vim.fn.expand("%:e")

    if not filetype_table[file_extension] then
      return
    end

    if header and header.update_date_modified then
      header.update_date_modified()
    else
      vim.notify_once("header.update_date_modified is not available", vim.log.levels.WARN)
    end
  end,
  group = copyright_group,
  desc = "Update header's date modified",
})

autocmd("BufWritePost", {
  pattern = ".header.nvim",
  callback = function()
    local header = require("header")
    if not header then
      vim.notify_once(
        "Could not automatically reload header config from local file: header module not found",
        vim.log.levels.ERROR
      )
      return
    end

    local original_config = header.config
    -- re-setup header with the original config, but this also forces a recheck
    -- of the .header.nvim file.
    header.setup(original_config)

    if header.config ~= original_config then
      vim.notify("Updated header.nvim config", vim.log.levels.INFO)
    end
  end,
})
