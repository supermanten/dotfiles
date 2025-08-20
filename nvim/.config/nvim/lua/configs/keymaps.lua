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
map("i", "<C-e>", "<End>", { desc = "Move to End of Line in Insert" })

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

-- Resize window using leader + arrow keys
map("n", "<leader>+h", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<leader>-h", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<leader>+w", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<leader>-w", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

---------------------------------------------------

-- ## File and Buffer Management
-- Grouped under leader + f (for 'file') and leader + b (for 'buffer')
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit All" })

-- Neo Tree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>br", ":Neotree buffers reveal float<CR>", { desc = "Buffer Explorer" })

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
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy Find in Current Buffer" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
map("n", "<leader>ft", builtin.grep_string, { desc = "Find string under cursor" })
map("n", "<leader>fs", builtin.symbols, { desc = "Find Symbols" })

---------------------------------------------------

-- ## LSP
-- Grouped under leader + l
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP Definition" })
map("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP References" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP Symbols" })
map("n", "<leader>lws", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "LSP Workspace Symbols" })

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
