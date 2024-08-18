-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- deleting wrong binds
vim.keymap.del({ "n" }, "<C-f>")
vim.keymap.del({ "n" }, "<S-f>")

-- show func desc
vim.keymap.set({ "n" }, "<C-d>", function()
  vim.lsp.buf.hover()
end, { noremap = true, silent = true })

-- remove Shift + k and Ctrl + k keybinds
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("silent! bufdo nunmap <buffer> <S-k>")
    vim.cmd("silent! bufdo iunmap <buffer> <C-k>")
  end,
})

--fast movement
vim.keymap.set({ "n", "v" }, "<S-j>", "3jzz", { noremap = true })
vim.keymap.set({ "n", "v" }, "<S-k>", "3kzz", { noremap = true })

--next problem
vim.keymap.set("n", "<C-n>", function()
  vim.diagnostic.goto_next()
end, { noremap = true })

-- Shift + s to clear line and enter insert mode
vim.keymap.set("n", "<S-s>", "0C", { noremap = true })
-- Ctrl + c to copy
vim.keymap.set("v", "<C-c>", "y", { noremap = true })
-- Ctrl + v to paste
vim.keymap.set({ "n", "i" }, "<C-v>", "+p", { noremap = true })
-- Shift + h to move to the start of the line
vim.keymap.set({ "n", "v" }, "<S-h>", "^", { noremap = true })
-- Shfit + l to move to the end of the line
vim.keymap.set({ "n", "v" }, "<S-l>", "$", { noremap = true })
-- Ctrl + a to copy all file
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })

local function undo()
  vim.cmd("undo")
end
-- Ctrl + z to undo
vim.keymap.set({ "n", "v", "i" }, "<C-z>", undo, { noremap = true })

local builtin = require("telescope.builtin")
-- for a quick search
vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<S-f>", builtin.current_buffer_fuzzy_find, { noremap = true })

-- buffers
-- Close the current buffer with Ctrl + w
vim.api.nvim_set_keymap("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })

-- Switch to the next buffer with Tab
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })

-- Switch to the previous buffer with Shift + Tab
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- ctrl + backspace
vim.keymap.set("i", "<C-h>", "<C-w>", { silent = true })

-- deleting wrong keymaps
--vim.keymap.del({ "n", "i" }, "<A-j>")
--vim.keymap.del({ "n", "i" }, "<A-k>")
--vim.keymap.del({ "n" }, "<C-f>")
--vim.keymap.del({ "n" }, "<S-j>")
--vim.keymap.del({ "n" }, "<S-k>")

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", { noremap = true })
vim.keymap.set("n", "sv", ":vsplit<Return>", { noremap = true })
-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")

-- Rename everywhere
vim.api.nvim_set_keymap("n", "<leader>rn", ":Lspsaga rename<CR>", { silent = true, noremap = true })

-- Search using Hop
vim.api.nvim_set_keymap("n", "f", ":HopWord<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":HopChar2<CR>", { silent = true })

vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, { noremap = true })
