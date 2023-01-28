local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({})

local opts = { noremap = true, silent = true }

-- Only jump to error
vim.keymap.set("n", "<C-j>", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set("n", "<C-k>", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Only jump to warning
vim.keymap.set("n", "]w", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN })
end, opts)
vim.keymap.set("n", "[w", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })
end, opts)

-- Jump to all hints
vim.keymap.set('n', ']h', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '[h', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Adjust the flash when moving between diagnostics
vim.api.nvim_set_hl(0, 'SagaBeacon', {})
