-- File name: conform.lua
-- Author: Samuel Boyden
-- Date created: 2025-06-11
-- Date modified: 2025-08-10
-- ------
-- Copyright (c) 2025 Samuel Boyden. All rights reserved.

return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          go = { "golangci-lint" },
          lua = { "stylua" },
          sh = { "shfmt" },
          templ = { "templ" },
          rust = { "rustfmt" },
        },

        formatters = {
          rustfmt = {
            prepend_args = { "+nightly" },
          },
        },
      }

      return opts
    end,
  },
}
