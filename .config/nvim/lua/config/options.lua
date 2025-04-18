vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.g.editorconfig = true
vim.o.background = "dark"

vim.opt.termguicolors = true -- True color support
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.colorcolumn = "100"
vim.opt.cursorlineopt = "number"
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.hlsearch = false

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Amount to indent with << and <
vim.opt.tabstop = 2 -- How many spaces are shown per tab
vim.opt.softtabstop = 2 -- How many spaces are applied  when pressing Tab
vim.opt.smarttab = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.autoindent = true -- Keep indentation from previouse line
vim.opt.breakindent = true
vim.opt.linebreak = true -- Wrap lines at convenient points

vim.filetype.add({
  extension = { mdx = "markdown.mdx" },
})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
})
