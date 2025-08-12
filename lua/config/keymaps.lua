-- File name: keymaps.lua
-- Author: Samuel Boyden
-- Date created: 2025-06-11
-- Date modified: 2025-08-12
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local whichkey = require("which-key")

if jit.os == "OSX" then
  require("config.keymaps.osx").setup_keybinds(whichkey)
end

require("config.keymaps.all").setup_keybinds(whichkey)
