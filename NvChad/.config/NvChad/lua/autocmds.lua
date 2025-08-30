require "nvchad.autocmds"

--remove auto-comment
vim.cmd "autocmd BufEnter * set formatoptions-=cro"
vim.cmd "autocmd BufEnter * setlocal formatoptions-=cro"

-- Highlight on yank
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  command = "setlocal norelativenumber",
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  command = "setlocal relativenumber",
})

-- make buffer and lualine transparent
vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
  callback = function()
    -- 1.
    vim.cmd [[
      hi TabLineFill gui=nocombine
      hi WinBar gui=nocombine
    ]]
    -- 2.
    vim.cmd [[
      hi TabLineFill guibg=none
      hi WinBar gui=none
    ]]
    -- 3.
    vim.cmd [[
      hi! link TabLineFill Normal
      hi! link WinBar Normal
    ]]
    --4.
    vim.cmd "hi StatusLine guibg=NONE ctermbg=NONE"
  end,
})
