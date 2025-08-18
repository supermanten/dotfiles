return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		timeout = 500,
		win = {
			border = "rounded",
			padding = { 1, 2, 1, 2 },
		},
		layout = {
			align = "center", -- Center the popup
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
