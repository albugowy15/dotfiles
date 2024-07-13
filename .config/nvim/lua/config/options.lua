-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.termguicolors = true
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
vim.opt.cursorlineopt = "number"
vim.o.background = "dark"
-- vim.o.timeoutlen = 5000 -- Timoutlen to delay which key
vim.g.autoformat = false

-- Netrw config
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
