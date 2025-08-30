return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = {
					enable = true,
					-- Disable for large files to improve performance
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = { enable = true },
				incremental_selection = { enable = true },
				textobjects = { enable = true },
				-- Disable additional features for better performance
				ensure_installed = {}, -- Let auto_install handle this
			})
		end,
	},
}
