-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable autoformat on save
vim.g.autoformat = false
-- Detect .editorconfig
vim.g.editorconfig = true
-- Netrw basic
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"

local opt = vim.opt
opt.autowrite = false
opt.backup = false
opt.breakindent = true
opt.colorcolumn = "100"
opt.completeopt = "menu,preview"
opt.cursorlineopt = "number"
opt.expandtab = false
opt.formatoptions = "tcqj"
opt.hlsearch = false
opt.inccommand = "split"
opt.laststatus = 2
opt.pumblend = 0
opt.pumheight = 0
opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "winsize", "terminal" }
opt.shiftround = false
opt.shiftwidth = 4
opt.sidescrolloff = 0
opt.scrolloff = 10
opt.swapfile = false
opt.tabstop = 4
opt.updatetime = 250
opt.undofile = true
opt.virtualedit = ""
opt.wildmode = "full"

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"
