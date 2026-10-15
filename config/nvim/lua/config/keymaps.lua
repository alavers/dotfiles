-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.quickfix")

-- Disable horizontal trackpad scrolling.
for _, key in ipairs({ "<ScrollWheelLeft>", "<ScrollWheelRight>" }) do
  vim.keymap.set({ "n", "i" }, key, "<Nop>", { desc = "Disable horizontal trackpad scrolling" })
end

vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
