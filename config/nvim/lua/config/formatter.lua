return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.typescript = { "prettier", lsp_format = "never" }
      opts.formatters_by_ft.typescriptreact = { "prettier", lsp_format = "never" }
    end,
  },
}
