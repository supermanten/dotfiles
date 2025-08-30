-- File: lua/plugins/lualine.lua

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Call the separate configuration module
		require("core.lualine").setup()
	end,
}
