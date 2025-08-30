-- Keymap Configuration - Organized into separate files for maintainability
-- This file now loads all keymap modules instead of containing everything

-- Load all keymap modules
local ok_core, _ = pcall(require, "configs.keymaps-core")
if not ok_core then
	vim.notify("Failed to load core keymaps", vim.log.levels.WARN)
end

local ok_files, _ = pcall(require, "configs.keymaps-files")
if not ok_files then
	vim.notify("Failed to load file keymaps", vim.log.levels.WARN)
end

local ok_search, _ = pcall(require, "configs.keymaps-search")
if not ok_search then
	vim.notify("Failed to load search keymaps", vim.log.levels.WARN)
end

local ok_lsp, _ = pcall(require, "configs.keymaps-lsp")
if not ok_lsp then
	vim.notify("Failed to load LSP keymaps", vim.log.levels.WARN)
end

local ok_git, _ = pcall(require, "configs.keymaps-git")
if not ok_git then
	vim.notify("Failed to load git keymaps", vim.log.levels.WARN)
end

local ok_ui, _ = pcall(require, "configs.keymaps-ui")
if not ok_ui then
	vim.notify("Failed to load UI keymaps", vim.log.levels.WARN)
end

local ok_terminal, _ = pcall(require, "configs.keymaps-terminal")
if not ok_terminal then
	vim.notify("Failed to load terminal keymaps", vim.log.levels.WARN)
end

-- All keymaps are now loaded from their respective modules!
-- This keeps the configuration organized and maintainable.
