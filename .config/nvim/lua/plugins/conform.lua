return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
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
    formatters = {
      php_cs_fixer = {
        env = {
          PHP_CS_FIXER_IGNORE_ENV = true,
        },
      },
    },
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      astro = { "prettier" },
      go = { "goimports", "gofumpt" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
      -- rust = { "rust_analyzer" },
      graphql = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
      fish = { "fish_indent" },
      php = { "php_cs_fixer" },
    },
    format_on_save = {
      async = false,
      lsp_format = "fallback",
    },
  },
}
