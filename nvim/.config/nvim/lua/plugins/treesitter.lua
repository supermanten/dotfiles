return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			local ok, config = pcall(require, "nvim-treesitter.configs")
			if not ok then
				vim.notify("nvim-treesitter.configs not found", vim.log.levels.ERROR)
				return
			end

			local ok_setup, err = pcall(function()
				config.setup({
					auto_install = true,
					highlight = { enable = true },
					indent = { enable = true },
					incremental_selection = { enable = true },
					textobjects = { enable = true },
				})
			end)

			if not ok_setup then
				vim.notify("Failed to setup treesitter: " .. err, vim.log.levels.ERROR)
			end
		end,
	},
}
