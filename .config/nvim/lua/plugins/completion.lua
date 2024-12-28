-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 	},
-- 	config = function()
-- 		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
-- 		local cmp = require("cmp")
-- 		local defaults = require("cmp.config.default")()
-- 		local auto_select = true
-- 		cmp.setup({
-- 			completion = {
-- 				completeopt = "menu,menuone,noinsert",
-- 			},
-- 			preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
-- 				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
-- 				["<C-Space>"] = cmp.mapping.complete(),
-- 				["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
-- 				["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 				["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 				["<C-CR>"] = function(fallback)
-- 					cmp.abort()
-- 					fallback()
-- 				end,
-- 			}),
-- 			-- sources for autocompletion
-- 			sources = {
-- 				{ name = "lazydev" },
-- 				{ name = "nvim_lsp" },
-- 			},
-- 		})
-- 	end,
-- }

return {
	"saghen/blink.cmp",
	-- use a release tag to download pre-built binaries
	version = "*",
	event = "InsertEnter",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
		},
		sources = {
			default = { "lsp" },
			cmdline = {},
		},
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
		},
	},
}
