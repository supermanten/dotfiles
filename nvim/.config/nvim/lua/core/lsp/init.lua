-- File: lua/core/lsp/init.lua

local M = {}

function M.setup()
	local lspconfig = require("lspconfig")
	local capabilities = require("core.lsp.capabilities").get()
	local servers = require("core.lsp.servers")

	-- Setup each server listed in servers.lua
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
			-- You can add specific settings for each server here if needed
			-- For example:
			-- rust_analyzer = {
			--     settings = {
			--         ["rust-analyzer"] = {
			--             checkOnSave = {
			--                 command = "clippy",
			--             },
			--         },
			--     },
			-- },
		})
	end
end

return M
