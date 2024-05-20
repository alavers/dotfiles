local status, mark = pcall(require, 'harpoon.mark')
if (not status) then return end

local status2, ui = pcall(require, 'harpoon.ui')
if (not status2) then return end

-- space h harpoon_ui.toggle_quick_menu()
-- space 1 harpoon_ui.nav_file(3)


vim.keymap.set('n', '<leader>h', mark.add_file)
vim.keymap.set('n', '<leader>m', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
