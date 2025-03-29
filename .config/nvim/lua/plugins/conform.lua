return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = false, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      javascript = { "prettierd", stop_after_first = true },
      typescript = { "prettierd", stop_after_first = true },
      javascriptreact = { "prettierd", stop_after_first = true },
      typescriptreact = { "prettierd", stop_after_first = true },
      svelte = { "prettierd", stop_after_first = true },
      astro = { "prettierd", stop_after_first = true },
      go = { "gofumpt" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd", stop_after_first = true },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      ["markdown.mdx"] = { "prettierd" },
      graphql = { "prettierd" },
      lua = { "stylua" },
    },
    format_on_save = {
      async = false,
      lsp_format = "fallback",
    },
  },
}
