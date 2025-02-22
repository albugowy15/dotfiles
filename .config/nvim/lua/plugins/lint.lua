return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  -- use a release tag to download pre-built binaries
  version = "*",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      dockerfile = { "hadolint" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      astro = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
