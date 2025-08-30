local map = vim.keymap.set

-- Disable space in normal mode
map("n", "<Space>", "<Nop>", { desc = "Disable Space" })

-- Better navigation
-- Navigate between windows (panes) with Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- Move around in insert mode without leaving
map("i", "<C-h>", "<Left>", { desc = "Move Left in Insert" })
map("i", "<C-j>", "<Down>", { desc = "Move Down in Insert" })
map("i", "<C-k>", "<Up>", { desc = "Move Up in Insert" })
map("i", "<C-l>", "<Right>", { desc = "Move Right in Insert" })
map("i", "<C-b>", "<ESC>^i", { desc = "Move to Beginning of Line in Insert" })
-- Note: <C-e> removed to avoid conflict with blink.cmp completion menu
-- Alternative: use <A-e> for end of line if needed
-- map("i", "<A-e>", "<End>", { desc = "Move to End of Line in Insert" })

-- Better Indenting (already done, but a must-have)
map("v", "<", "<gv", { desc = "Unindent Selection" })
map("v", ">", ">gv", { desc = "Indent Selection" })

-- Make jk a consistent way to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })

-- Clear search highlights with ESC
map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Clear Highlights" })

---------------------------------------------------

-- ## Window Management
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>q", "<C-W>c", { desc = "Close Window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close Other Windows" })
map("n", "<leader>wt", "<C-W>T", { desc = "Move Window to New Tab" })
map("n", "<leader>wr", "<C-W>r", { desc = "Rotate Windows" })
map("n", "<leader>w=", "<C-W>=", { desc = "Equalize Window Sizes" })

-- Resize window using leader + arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Quick window navigation with <leader>w prefix
map("n", "<leader>wh", "<C-W>h", { desc = "Go to Left Window" })
map("n", "<leader>wj", "<C-W>j", { desc = "Go to Bottom Window" })
map("n", "<leader>wk", "<C-W>k", { desc = "Go to Top Window" })
map("n", "<leader>wl", "<C-W>l", { desc = "Go to Right Window" })

-- Window movement
map("n", "<leader>wH", "<C-W>H", { desc = "Move Window Left" })
map("n", "<leader>wJ", "<C-W>J", { desc = "Move Window Down" })
map("n", "<leader>wK", "<C-W>K", { desc = "Move Window Up" })
map("n", "<leader>wL", "<C-W>L", { desc = "Move Window Right" })

---------------------------------------------------

-- ## File and Buffer Management
-- Grouped under leader + f (for 'file') and leader + b (for 'buffer')
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>fS", "<cmd>wa<cr>", { desc = "Save All Files" })
map("n", "<leader>fa", "<cmd>wqa<cr>", { desc = "Save All and Quit" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Force Quit All" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Force Delete Buffer" })
map("n", "<leader>bc", "<cmd>%bd|e#<cr>", { desc = "Close Other Buffers" })

-- Neo Tree - Enhanced File Navigation
map("n", "<leader>e", function()
	local ok, _ = pcall(vim.cmd, "Neotree toggle")
	if not ok then
		vim.notify("Neo-tree not available", vim.log.levels.WARN)
	end
end, { desc = "Toggle File Explorer" })

map("n", "<leader>E", function()
	local ok, _ = pcall(vim.cmd, "Neotree focus")
	if not ok then
		vim.notify("Neo-tree not available", vim.log.levels.WARN)
	end
end, { desc = "Focus File Explorer" })

map("n", "<leader>be", function()
	local ok, _ = pcall(vim.cmd, "Neotree buffers reveal float")
	if not ok then
		vim.notify("Neo-tree buffers not available", vim.log.levels.WARN)
	end
end, { desc = "Buffer Explorer" })

map("n", "<leader>gs", function()
	local ok, _ = pcall(vim.cmd, "Neotree git_status reveal float")
	if not ok then
		vim.notify("Neo-tree git status not available", vim.log.levels.WARN)
	end
end, { desc = "Git Status Explorer" })

map("n", "<leader>fe", function()
	local ok, _ = pcall(vim.cmd, "Neotree filesystem reveal left")
	if not ok then
		vim.notify("Neo-tree filesystem not available", vim.log.levels.WARN)
	end
end, { desc = "Filesystem Explorer" })

-- Quick file operations
map("n", "<leader>nf", function()
	local ok, _ = pcall(vim.cmd, "Neotree filesystem reveal left")
	if not ok then
		vim.notify("Neo-tree filesystem not available", vim.log.levels.WARN)
	end
end, { desc = "Reveal Current File" })

map("n", "<leader>nc", function()
	local ok, _ = pcall(vim.cmd, "Neotree close")
	if not ok then
		vim.notify("Neo-tree close not available", vim.log.levels.WARN)
	end
end, { desc = "Close Neo-tree" })

map("n", "<leader>nr", function()
	local ok, _ = pcall(vim.cmd, "Neotree refresh")
	if not ok then
		vim.notify("Neo-tree refresh not available", vim.log.levels.WARN)
	end
end, { desc = "Refresh Neo-tree" })

-- BufferLine
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
map("n", "<leader>bo", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete Non-Pinned Buffers" })
map("n", "<leader>bc", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })

---------------------------------------------------

-- ## Telescope
-- Grouped under leader + f (for 'find')
local builtin = require("telescope.builtin")
map("n", "<leader>ff", function()
	local ok, _ = pcall(builtin.find_files)
	if not ok then
		vim.notify("Find files not available", vim.log.levels.WARN)
	end
end, { desc = "Find Files" })

map("n", "<leader>fF", function()
	local ok, telescope = pcall(require, "telescope")
	if ok and telescope.extensions and telescope.extensions.smart_open then
		telescope.extensions.smart_open.smart_open()
	else
		vim.notify("Smart open not available", vim.log.levels.WARN)
	end
end, { desc = "Smart Open Files" })

map("n", "<leader>fg", function()
	local ok, _ = pcall(builtin.live_grep)
	if not ok then
		vim.notify("Live grep not available", vim.log.levels.WARN)
	end
end, { desc = "Live Grep" })

map("n", "<leader>fG", function()
	local ok, _ = pcall(builtin.live_grep, { cwd = vim.fn.expand("%:p:h") })
	if not ok then
		vim.notify("Live grep in directory not available", vim.log.levels.WARN)
	end
end, { desc = "Live Grep in Directory" })

map("n", "<leader>fb", function()
	local ok, _ = pcall(builtin.buffers)
	if not ok then
		vim.notify("Buffers search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Buffers" })

map("n", "<leader>fo", function()
	local ok, _ = pcall(builtin.oldfiles)
	if not ok then
		vim.notify("Old files search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Old Files" })

map("n", "<leader>fr", function()
	local ok, _ = pcall(builtin.resume)
	if not ok then
		vim.notify("Resume search not available", vim.log.levels.WARN)
	end
end, { desc = "Resume Last Search" })

map("n", "<leader>fz", function()
	local ok, _ = pcall(builtin.current_buffer_fuzzy_find)
	if not ok then
		vim.notify("Buffer fuzzy find not available", vim.log.levels.WARN)
	end
end, { desc = "Fuzzy Find in Current Buffer" })

map("n", "<leader>fh", function()
	local ok, _ = pcall(builtin.help_tags)
	if not ok then
		vim.notify("Help tags not available", vim.log.levels.WARN)
	end
end, { desc = "Find Help Tags" })

map("n", "<leader>fm", function()
	local ok, _ = pcall(builtin.man_pages)
	if not ok then
		vim.notify("Man pages not available", vim.log.levels.WARN)
	end
end, { desc = "Find Man Pages" })

map("n", "<leader>fk", function()
	local ok, _ = pcall(builtin.keymaps)
	if not ok then
		vim.notify("Keymaps search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Keymaps" })

map("n", "<leader>fc", function()
	local ok, _ = pcall(builtin.commands)
	if not ok then
		vim.notify("Commands search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Commands" })

map("n", "<leader>ft", function()
	local ok, _ = pcall(builtin.grep_string)
	if not ok then
		vim.notify("Grep string not available", vim.log.levels.WARN)
	end
end, { desc = "Find string under cursor" })

map("n", "<leader>fT", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cword>") })
	if not ok then
		vim.notify("Grep word under cursor not available", vim.log.levels.WARN)
	end
end, { desc = "Find Word Under Cursor" })

map("n", "<leader>fs", function()
	local ok, _ = pcall(builtin.symbols)
	if not ok then
		vim.notify("Symbols search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Symbols" })

map("n", "<leader>fS", function()
	local ok, _ = pcall(builtin.lsp_workspace_symbols)
	if not ok then
		vim.notify("Workspace symbols not available", vim.log.levels.WARN)
	end
end, { desc = "Find Workspace Symbols" })

-- Quick search shortcuts
map("n", "<leader>/", function()
	local ok, _ = pcall(builtin.live_grep)
	if not ok then
		vim.notify("Project search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Project" })

map("n", "<leader>?", function()
	local ok, _ = pcall(builtin.current_buffer_fuzzy_find)
	if not ok then
		vim.notify("Buffer search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Current Buffer" })

map("n", "<leader>*", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cword>") })
	if not ok then
		vim.notify("Word search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Word Under Cursor" })

map("v", "<leader>*", function()
	local text = vim.get_visual_selection()
	local ok, _ = pcall(builtin.grep_string, { search = text })
	if not ok then
		vim.notify("Visual selection search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Visual Selection" })

-- Enhanced navigation
map("n", "<leader>gf", function()
	local ok, _ = pcall(builtin.git_files)
	if not ok then
		vim.notify("Git files search not available (not in git repo)", vim.log.levels.WARN)
	end
end, { desc = "Search Git Files" })

map("n", "<leader>gb", function()
	local ok, _ = pcall(builtin.git_branches)
	if not ok then
		vim.notify("Git branches search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Git Branches" })

map("n", "<leader>gc", function()
	local ok, _ = pcall(builtin.git_commits)
	if not ok then
		vim.notify("Git commits search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Git Commits" })

map("n", "<leader>gC", function()
	local ok, _ = pcall(builtin.git_bcommits)
	if not ok then
		vim.notify("Git buffer commits search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Git Commits for Buffer" })

-- Quick access to important files
map("n", "<leader>en", function() builtin.find_files({ cwd = "~/.config/nvim" }) end, { desc = "Edit Neovim Config" })
map("n", "<leader>ez", function() builtin.find_files({ cwd = "~" }) end, { desc = "Edit Zsh Config" })

---------------------------------------------------

-- ## LSP Navigation & Symbols
-- Grouped under leader + l
map("n", "<leader>ld", function()
	local ok, _ = pcall(vim.lsp.buf.definition)
	if not ok then
		vim.notify("LSP definition not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Definition" })

map("n", "<leader>lD", function()
	local ok, _ = pcall(vim.lsp.buf.declaration)
	if not ok then
		vim.notify("LSP declaration not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Declaration" })

map("n", "<leader>lt", function()
	local ok, _ = pcall(vim.lsp.buf.type_definition)
	if not ok then
		vim.notify("LSP type definition not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Type Definition" })

map("n", "<leader>lI", function()
	local ok, _ = pcall(vim.lsp.buf.implementation)
	if not ok then
		vim.notify("LSP implementation not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Implementation" })

map("n", "<leader>lr", function()
	local ok, _ = pcall(vim.lsp.buf.references)
	if not ok then
		vim.notify("LSP references not available", vim.log.levels.WARN)
	end
end, { desc = "Find References" })

map("n", "<leader>la", function()
	local ok, _ = pcall(vim.lsp.buf.code_action)
	if not ok then
		vim.notify("LSP code actions not available", vim.log.levels.WARN)
	end
end, { desc = "Code Actions" })

map("v", "<leader>la", function()
	local ok, _ = pcall(vim.lsp.buf.code_action)
	if not ok then
		vim.notify("LSP code actions not available", vim.log.levels.WARN)
	end
end, { desc = "Code Actions (Visual)" })

map("n", "<leader>lq", function()
	local ok, _ = pcall(vim.lsp.buf.code_action)
	if not ok then
		vim.notify("LSP quick fix not available", vim.log.levels.WARN)
	end
end, { desc = "Quick Fix" })

map("n", "<leader>ln", function()
	local ok, _ = pcall(vim.lsp.buf.rename)
	if not ok then
		vim.notify("LSP rename not available", vim.log.levels.WARN)
	end
end, { desc = "Rename Symbol" })
map("n", "<leader>lf", function()
	local ok, _ = pcall(vim.lsp.buf.format, { async = true })
	if not ok then
		vim.notify("LSP formatting not available", vim.log.levels.WARN)
	end
end, { desc = "Format Document" })

map("v", "<leader>lf", function()
	local ok, _ = pcall(vim.lsp.buf.format, { async = true })
	if not ok then
		vim.notify("LSP formatting not available", vim.log.levels.WARN)
	end
end, { desc = "Format Selection" })
map("n", "<leader>lh", function()
	local ok, _ = pcall(function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end)
	if not ok then
		vim.notify("Inlay hints not supported by LSP", vim.log.levels.WARN)
	end
end, { desc = "Toggle Inlay Hints" })

-- Symbol navigation
map("n", "<leader>ls", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_document_symbols")
	if not ok then
		vim.notify("Document symbols not available", vim.log.levels.WARN)
	end
end, { desc = "Document Symbols" })

map("n", "<leader>lS", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_workspace_symbols")
	if not ok then
		vim.notify("Workspace symbols not available", vim.log.levels.WARN)
	end
end, { desc = "Workspace Symbols" })

map("n", "<leader>lc", function()
	local ok, _ = pcall(vim.lsp.codelens.run)
	if not ok then
		vim.notify("Code lens not available", vim.log.levels.WARN)
	end
end, { desc = "Run Code Lens" })

map("n", "<leader>lC", function()
	local ok, _ = pcall(vim.lsp.codelens.refresh)
	if not ok then
		vim.notify("Code lens refresh not available", vim.log.levels.WARN)
	end
end, { desc = "Refresh Code Lens" })

map("n", "<leader>lo", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_outgoing_calls")
	if not ok then
		vim.notify("Outgoing calls not available", vim.log.levels.WARN)
	end
end, { desc = "Outgoing Calls" })

map("n", "<leader>lI", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_incoming_calls")
	if not ok then
		vim.notify("Incoming calls not available", vim.log.levels.WARN)
	end
end, { desc = "Incoming Calls" })

-- Enhanced hover and help
map("n", "<leader>lk", function()
	local ok, _ = pcall(vim.lsp.buf.hover)
	if not ok then
		vim.notify("LSP hover not available", vim.log.levels.WARN)
	end
end, { desc = "Hover Documentation" })

map("n", "<leader>lK", function()
	local ok, _ = pcall(vim.lsp.buf.signature_help)
	if not ok then
		vim.notify("LSP signature help not available", vim.log.levels.WARN)
	end
end, { desc = "Signature Help" })

map("i", "<C-k>", function()
	local ok, _ = pcall(vim.lsp.buf.signature_help)
	if not ok then
		vim.notify("LSP signature help not available", vim.log.levels.WARN)
	end
end, { desc = "Signature Help" })

-- Diagnostics navigation
map("n", "<leader>dp", function()
	local ok, _ = pcall(vim.diagnostic.goto_prev)
	if not ok then
		vim.notify("No previous diagnostic", vim.log.levels.WARN)
	end
end, { desc = "Previous Diagnostic" })

map("n", "<leader>dn", function()
	local ok, _ = pcall(vim.diagnostic.goto_next)
	if not ok then
		vim.notify("No next diagnostic", vim.log.levels.WARN)
	end
end, { desc = "Next Diagnostic" })

map("n", "<leader>dl", function()
	local ok, _ = pcall(vim.cmd, "Telescope diagnostics")
	if not ok then
		vim.notify("Diagnostics list not available", vim.log.levels.WARN)
	end
end, { desc = "List All Diagnostics" })

map("n", "<leader>dL", function()
	local ok, _ = pcall(vim.cmd, "Telescope diagnostics bufnr=0")
	if not ok then
		vim.notify("Buffer diagnostics not available", vim.log.levels.WARN)
	end
end, { desc = "List Buffer Diagnostics" })

map("n", "<leader>dd", function()
	local ok, _ = pcall(vim.diagnostic.open_float)
	if not ok then
		vim.notify("No diagnostic at cursor", vim.log.levels.WARN)
	end
end, { desc = "Show Diagnostic" })

map("n", "<leader>dq", function()
	local ok, _ = pcall(vim.diagnostic.setloclist)
	if not ok then
		vim.notify("Failed to set diagnostics loclist", vim.log.levels.WARN)
	end
end, { desc = "Send Diagnostics to Loclist" })

-- Quick navigation shortcuts
map("n", "gd", function()
	local ok, _ = pcall(vim.lsp.buf.definition)
	if not ok then
		vim.notify("LSP definition not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Definition" })

map("n", "gD", function()
	local ok, _ = pcall(vim.lsp.buf.declaration)
	if not ok then
		vim.notify("LSP declaration not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Declaration" })

map("n", "gi", function()
	local ok, _ = pcall(vim.lsp.buf.implementation)
	if not ok then
		vim.notify("LSP implementation not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Implementation" })

map("n", "gr", function()
	local ok, _ = pcall(vim.lsp.buf.references)
	if not ok then
		vim.notify("LSP references not available", vim.log.levels.WARN)
	end
end, { desc = "Find References" })

map("n", "K", function()
	local ok, _ = pcall(vim.lsp.buf.hover)
	if not ok then
		vim.notify("LSP hover not available", vim.log.levels.WARN)
	end
end, { desc = "Hover Documentation" })

map("n", "<C-k>", function()
	local ok, _ = pcall(vim.lsp.buf.signature_help)
	if not ok then
		vim.notify("LSP signature help not available", vim.log.levels.WARN)
	end
end, { desc = "Signature Help" })

-- Todo
map("n", "<leader>I", ":TodoTelescope<CR>", { desc = "Todo Telescope" })

---------------------------------------------------

-- ## Terminal
map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("t", "<esc><esc>", "<cmd>ToggleTerm<cr>", { desc = "Exit ToggleTerm" })

---------------------------------------------------

-- ## Flutter Tools
-- Grouped under leader + F
map("n", "<leader>Ff", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
map("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
map("n", "<leader>Fr", "<cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" })
map("n", "<leader>FR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Hot Restart" })
map("n", "<leader>Fd", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })

---------------------------------------------------

-- ## Move Lines
map("n", "<A-j>", ":move .+1<CR>==", { desc = "Move Line Down" })
map("n", "<A-k>", ":move .-2<CR>==", { desc = "Move Line Up" })
map("v", "<A-j>", ":move '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":move '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("i", "<A-j>", "<Esc>:move .+1<CR>==gi", { desc = "Move Line Down" })
map("i", "<A-k>", "<Esc>:move .-2<CR>==gi", { desc = "Move Line Up" })

-- Toggle high-contrast mode
vim.api.nvim_create_user_command("ToggleContrast", function()
	local current = vim.g.high_contrast or false
	if current then
		vim.cmd("colorscheme catppuccin")
		vim.g.high_contrast = false
	else
		vim.cmd("hi Normal guibg=#000000 guifg=#ffffff")
		vim.cmd("hi Comment guifg=#888888")
		vim.g.high_contrast = true
	end
end, {})

map("n", "<leader>hc", "<cmd>ToggleContrast<CR>", { desc = "Toggle High Contrast" })

---------------------------------------------------

-- ## Performance Monitoring
map("n", "<leader>ps", "<cmd>Lazy profile<CR>", { desc = "Profile plugin startup time" })
map("n", "<leader>pl", "<cmd>Lazy log<CR>", { desc = "Show Lazy logs" })
map("n", "<leader>ph", "<cmd>Lazy health<CR>", { desc = "Check plugin health" })
map("n", "<leader>pm", "<cmd>messages<CR>", { desc = "Show recent messages" })
map("n", "<leader>pt", function()
	local stats = require("lazy").stats()
	local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
	vim.notify(string.format("⚡ Neovim loaded %d/%d plugins in %s ms", stats.loaded, stats.count, ms), vim.log.levels.INFO)
end, { desc = "Show startup time" })

---------------------------------------------------

-- ## Quality of Life Improvements
-- Better search
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>sw", "<cmd>keepjumps normal! mi*`i<CR>", { desc = "Search word under cursor" })

-- Line operations
map("n", "<leader>cl", "<cmd>center<CR>", { desc = "Center current line" })
map("n", "<leader>zt", "<cmd>normal! zt<CR>", { desc = "Top current line" })
map("n", "<leader>zz", "<cmd>normal! zz<CR>", { desc = "Center current line" })
map("n", "<leader>zb", "<cmd>normal! zb<CR>", { desc = "Bottom current line" })

-- Quick commands
map("n", "<leader>cd", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", { desc = "Change to current file directory" })
map("n", "<leader>cp", "<cmd>let @+ = expand('%:p')<CR><cmd>echo 'Copied: ' . @+<CR>", { desc = "Copy current file path" })
map("n", "<leader>cP", "<cmd>let @+ = expand('%:p:h')<CR><cmd>echo 'Copied: ' . @+<CR>", { desc = "Copy current file directory" })

-- Enhanced search and navigation
map("n", "<leader>sw", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cword>") })
	if not ok then
		vim.notify("Word search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Word Under Cursor" })

map("n", "<leader>sW", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cWORD>") })
	if not ok then
		vim.notify("WORD search not available", vim.log.levels.WARN)
	end
end, { desc = "Search WORD Under Cursor" })

map("n", "<leader>sd", function()
	local ok, _ = pcall(builtin.live_grep, { cwd = vim.fn.expand("%:p:h") })
	if not ok then
		vim.notify("Directory search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Directory" })

map("n", "<leader>sp", function()
	local ok, _ = pcall(builtin.live_grep)
	if not ok then
		vim.notify("Project search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Project" })

-- Quick navigation
map("n", "<leader>bb", function()
	local ok, _ = pcall(builtin.buffers)
	if not ok then
		vim.notify("Buffer list not available", vim.log.levels.WARN)
	end
end, { desc = "List Buffers" })

map("n", "<leader>bt", function()
	local ok, _ = pcall(builtin.filetypes)
	if not ok then
		vim.notify("File types list not available", vim.log.levels.WARN)
	end
end, { desc = "List File Types" })

map("n", "<leader>bh", function()
	local ok, _ = pcall(builtin.oldfiles)
	if not ok then
		vim.notify("Recent files not available", vim.log.levels.WARN)
	end
end, { desc = "Recent Files" })
