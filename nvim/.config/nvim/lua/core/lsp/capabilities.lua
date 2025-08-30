-- File: lua/core/lsp/capabilities.lua

local M = {}

M.get = function()
	-- Assuming blink.cmp is already loaded and available
	return require("blink.cmp").get_lsp_capabilities()
end

return M
