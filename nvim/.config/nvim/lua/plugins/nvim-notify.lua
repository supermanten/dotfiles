return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss All Notifications",
		},
	},
	opts = {
		stages = "fade_in_slide_out",
		timeout = 3000,
		max_width = 50,
		max_height = 10,
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
		border = "rounded",
		background_colour = "#000000",
	},
}
