-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Open netrw" })
vim.keymap.set("v", "p", '"_dP', { desc = "Keep last yanked when pasting" })
