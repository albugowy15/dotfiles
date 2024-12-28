return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "VeryLazy" },
		-- dependencies = {
		-- 	{ "nvim-treesitter/nvim-treesitter-textobjects" },
		-- },
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		-- lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		-- keys = {
		-- 	{ "<c-space>", desc = "Increment Selection" },
		-- 	{ "<bs>", desc = "Decrement Selection", mode = "x" },
		-- },
		opts = {
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"html",
				"javascript",
				"json5",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"ninja",
				"prisma",
				"python",
				"query",
				"rust",
				"ron",
				"rst",
				"sql",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
			},
			-- Autoinstall languages that are not installed
			auto_install = false,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
	},
}
