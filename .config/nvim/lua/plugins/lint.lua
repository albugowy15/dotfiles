return {
  "mfussenegger/nvim-lint",
  -- use a release tag to download pre-built binaries
  version = "*",
  opts = {
    linters_by_ft = {
      dockerfile = { "hadolint" },
      fish = { "fish" },
      php = { "phpcs" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("owi-nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint({}, { ignore_errors = true })
      end,
    })
  end,
}
