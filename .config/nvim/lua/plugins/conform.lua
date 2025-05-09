return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = false, lsp_format = "fallback", stop_after_first = true })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    notify_on_error = false,
    stop_after_first = true,
    formatters = {
      biome = {
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      ["markdown.mdx"] = { "prettier" },
      astro = { "biome", "prettier", stop_after_first = true },
      css = { "prettier" },
      go = { "gofumpt" },
      graphql = { "prettier" },
      html = { "prettier" },
      javascript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      json = { "biome", "prettier", stop_after_first = true },
      lua = { "stylua" },
      markdown = { "prettier" },
      svelte = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      yaml = { "prettier" },
    },
    -- format_on_save = {
    --   async = false,
    --   lsp_format = "fallback",
    --   stop_after_first = true,
    -- },
  },
}
