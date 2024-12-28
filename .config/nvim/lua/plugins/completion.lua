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
			documentation = { auto_show = false },
			ghost_text = { enabled = false },
		},
		sources = {
			default = { "lsp" },
			cmdline = {},
		},
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
		},
		signature = { enabled = false },
	},
}
