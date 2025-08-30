-- File: lua/core/lualine/theme.lua

local colors = require("core.lualine.colors")

local M = {
	normal = {
		a = { bg = colors.blue, fg = colors.bg_dark, gui = "bold" },
		b = { bg = colors.gray2, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	insert = {
		a = { bg = colors.green, fg = colors.bg_dark, gui = "bold" },
		b = { bg = colors.gray2, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	visual = {
		a = { bg = colors.purple, fg = colors.bg_dark, gui = "bold" },
		b = { bg = colors.gray2, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	replace = {
		a = { bg = colors.red, fg = colors.bg_dark, gui = "bold" },
		b = { bg = colors.gray2, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	command = {
		a = { bg = colors.orange, fg = colors.bg_dark, gui = "bold" },
		b = { bg = colors.gray2, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.fg },
	},
	inactive = {
		a = { bg = colors.gray1, fg = colors.subtext3, gui = "bold" },
		b = { bg = colors.gray1, fg = colors.subtext3 },
		c = { bg = colors.gray1, fg = colors.subtext3 },
	},
}

return M
