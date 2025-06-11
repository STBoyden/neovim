return {
  {
    "stevearc/conform.nvim",
    opts = function()
      ---@type conform.setupOpts
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          go = { "golangci-lint" },
          sh = { "shfmt" },
        },
      }

      return opts
    end,
  },
}
