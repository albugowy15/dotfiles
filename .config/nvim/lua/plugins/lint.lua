return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  version = "*",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      astro = { "eslint" },
      dockerfile = { "hadolint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      svelte = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
