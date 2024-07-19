local client = vim.lsp.start_client({
  name = "toylsp",
  cmd = { "/home/bughowi/dev/learn/toylsp/main" },
  -- on_attach = require("nvim-lsp").on_attach
})

if not client then
  vim.notify("hey, you didnt do the client thing good")
  return
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.lsp.buf_attach_client(0, client)
  end,
})
