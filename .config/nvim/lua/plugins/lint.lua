return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  version = "*",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      dockerfile = { "hadolint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      astro = { "eslint" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
