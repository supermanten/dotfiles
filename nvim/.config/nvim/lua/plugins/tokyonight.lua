return {
	"folke/tokyonight.nvim",
	lazy = true,
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			transparent_background = true,
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				dark = "macchiato",
			},
			float = {
				transparent = true, -- enable transparent floating windows
				solid = true, -- use solid styling for floating windows, see |winborder|
			},
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				mason = true,
				neotree = true,
				noice = true,
				telescope = {
					enabled = true,
				},
				lsp_trouble = true,
				which_key = true,
				mini = {
					enabled = true,
					indentscope_color = "lavender",
				},
				blink_cmp = {
					style = "bordered",
				},
			},
			indent_blankline = {
				enabled = true,
				scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
				colored_indent_levels = true,
			},
		},
	},
}
