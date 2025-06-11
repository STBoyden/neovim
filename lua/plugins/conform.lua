return {
  require("conform").setup({
    formatters_by_ft = {
      go = { "golangci-lint" },
      kotlin = { "ktlint" },
    },
  }),
}
