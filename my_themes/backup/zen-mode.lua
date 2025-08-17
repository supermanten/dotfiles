return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 0,
			width = 100,
			height = 1,
		},
		plugins = {
			options = {
				enabled = true,
				ruler = true,
				showcmd = true,
				laststatus = 0,
			},
			kitty = {
				enabled = true,
				font = "+3", -- font size increment
			},
		},
	},
}
