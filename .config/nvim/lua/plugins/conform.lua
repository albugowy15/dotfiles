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
      javascript = { "biome", "prettierd", stop_after_first = true },
      typescript = { "biome", "prettierd", stop_after_first = true },
      javascriptreact = { "biome", "prettierd", stop_after_first = true },
      typescriptreact = { "biome", "prettierd", stop_after_first = true },
      svelte = { "biome", "prettierd", stop_after_first = true },
      astro = { "biome", "prettierd", stop_after_first = true },
      go = { "gofumpt" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "biome", "prettierd", stop_after_first = true },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      ["markdown.mdx"] = { "prettierd" },
      graphql = { "prettierd" },
      lua = { "stylua" },
    },
    format_on_save = {
      async = false,
      lsp_format = "fallback",
      stop_after_first = true,
    },
  },
}
