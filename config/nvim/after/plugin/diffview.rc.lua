local status, diffview = pcall(require, 'diffview')
if (not status) then return end

vim.keymap.set('n', '<leader>do', '<Cmd>DiffviewOpen<CR>', {})
vim.keymap.set('n', '<leader>dc', '<Cmd>DiffviewClose<CR>', {})
vim.keymap.set('n', '<leader>o', function()
  require('diffview.config').actions.focus_entry()
end)
