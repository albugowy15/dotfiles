return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_format = "fallback",
          async = true,
          stop_after_first = true,
        })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    notify_on_error = false,
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      biome = {
        require_cwd = true,
      },
      prettier = {
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      ["markdown.mdx"] = { "prettier" },
      astro = { "prettier", stop_after_first = true },
      css = { "prettier" },
      go = { "gofumpt" },
      graphql = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier", stop_after_first = true },
      javascriptreact = { "prettier", stop_after_first = true },
      json = { "prettier" },
      jsonc = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      svelte = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
      yaml = { "prettier" },
      sh = { "shfmt" },
      xml = { "lemminx" },
    },
    format_after_save = {
      lsp_format = "fallback",
      stop_after_first = true,
    },
  },
}
