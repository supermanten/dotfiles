return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				start_in_insert = true,
				insert_mappings = true,
				close_on_exit = true,
				direction = "float",
				float_opts = {
					border = "rounded",
					winblend = 10,
				},
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				persist_size = true,
				persist_mode = true,
				direction = "float",
			})
		end,
	},
}
