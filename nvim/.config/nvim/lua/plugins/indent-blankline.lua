return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	config = function()
		-- Define highlights for catppuccin integration
		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#313244" }) -- Catppuccin surface0
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#f38ba8", bold = true }) -- Catppuccin red
	end,
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
			highlight = "IblIndent",
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			highlight = "IblScope",
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"NvimTree",
				"Trouble",
				"trouble",
				"neo-tree",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
}
