local status, diffview = pcall(require, 'diffview')
if (not status) then return end

vim.keymap.set('n', '<leader>gd', '<Cmd>DiffviewOpen<CR>', {})
vim.keymap.set('n', '<leader>gc', '<Cmd>DiffviewClose<CR>', {})
