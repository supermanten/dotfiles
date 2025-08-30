-- File: lua/core/lualine/init.lua

local theme = require("core.lualine.theme")
local sections = require("core.lualine.sections")

local M = {}

function M.setup()
	local lualine = require("lualine")

	lualine.setup({
		options = {
			theme = theme,
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = {}, winbar = {} },
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = sections.lualine_a,
			lualine_b = sections.lualine_b,
			lualine_c = sections.lualine_c,
			lualine_x = sections.lualine_x,
			lualine_y = sections.lualine_y,
			lualine_z = sections.lualine_z,
		},
		winbar = sections.winbar,
		inactive_winbar = sections.inactive_winbar,
	})
end

return M
