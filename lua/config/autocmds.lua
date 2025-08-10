--[[
-- File name: autocmds.lua
-- Author: Samuel Boyden
-- Date created: 2025-07-29
-- Date modified: 2025-08-10
-- All rights reserved.
--]]

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local copyright_group = "copyright_group"
augroup(copyright_group, { clear = true })

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local header = require("header")
    local header_helper = require("config.helpers.header")

    local added_header = header_helper and header_helper.add_header_if_not_present()

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
