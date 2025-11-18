local debounce = function(ms, fn)
  local timer = vim.uv.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

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
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = debounce(500, function()
        lint.try_lint(nil, { ignore_errors = true })
      end),
    })
  end,
  -- config = function()
  --   local lint = require("lint")
  --   lint.linters_by_ft = {
  --     astro = { "eslint" },
  --     dockerfile = { "hadolint" },
  --     javascript = { "eslint" },
  --     javascriptreact = { "eslint" },
  --     svelte = { "eslint" },
  --     typescript = { "eslint" },
  --     typescriptreact = { "eslint" },
  --   }
  --   local lint_augroup = vim.api.nvim_create_augroup("lint", {
  --     clear = true,
  --   })
  --
  --   vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  --     group = lint_augroup,
  --     callback = function()
  --       lint.try_lint(nil, { ignore_errors = true })
  --     end,
  --   })
  -- end,
}
