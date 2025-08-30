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
		max_width = 60,
		max_height = 12,
		icons = {
			ERROR = " ",
			WARN = " ",
			INFO = " ",
			DEBUG = " ",
			TRACE = " ",
		},
		border = "rounded",
		background_colour = "#0f0f23", -- Match lualine bg
		-- Enhanced styling
		render = "compact",
		minimum_width = 30,
		-- Position and animation
		top_down = true, -- Show from bottom
		-- Custom highlights
		on_open = function(_)
			vim.api.nvim_set_option_value("winblend", 10, { scope = "local" })
		end,
	},
}
