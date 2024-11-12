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
-- opt.expandtab = false
-- opt.formatoptions = "tcqj"
opt.hlsearch = false
opt.inccommand = "split"
-- opt.laststatus = 2
-- opt.pumblend = 0
-- opt.pumheight = 0
-- opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "winsize", "terminal" }
-- opt.shiftround = false
-- opt.shiftwidth = 4
-- opt.sidescrolloff = 0
-- opt.scrolloff = 10
opt.swapfile = false
-- opt.tabstop = 4
-- opt.updatetime = 250
-- opt.undofile = true
-- opt.virtualedit = ""
-- opt.wildmode = "full"
opt.smoothscroll = false
opt.foldexpr = "0"
opt.foldmethod = "manual"
opt.foldtext = "foldtext()"

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

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

-- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
vim.g.lazyvim_picker = "telescope"

-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = false
