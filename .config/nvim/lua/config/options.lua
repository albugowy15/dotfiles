vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.have_nerd_font = true

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Detect .editorconfig
vim.g.editorconfig = true

vim.o.background = "dark" -- or "light" for light mode

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 1000

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.colorcolumn = "120"
vim.opt.cursorlineopt = "number"
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.linebreak = true -- Wrap lines at convenient points
-- vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
-- vim.opt.sidescrolloff = 8 -- Columns of context
-- vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions

vim.opt.ruler = true

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
