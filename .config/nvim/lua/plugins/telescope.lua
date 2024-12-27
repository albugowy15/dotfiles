return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files (Root Dir)" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Files (git-files)" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Commits" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep (Root Dir)" })
			vim.keymap.set("n", '<leader>s"', builtin.registers, { desc = "Registers" })
			vim.keymap.set(
				"n",
				"<leader>sD",
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				{ desc = "Document Diagnostics" }
			)
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Workspace Diagnostics" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
