local keymap = vim.keymap

vim.g.mapleader = ','

-- Toggle quickfix window
keymap.set('n', '<leader>q', ':copen 40<cr>', { silent = true })
keymap.set('n', '<leader>a', ':copen 10<cr>', { silent = true })
keymap.set('n', '<leader>z', ':lua toggle_qf()<cr>', { silent = true })

-- Save with ,,
keymap.set('n', '<leader>,', ':w<cr>')

-- Cusor behave with wrapped lines
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set('v', 'j', 'gj')
keymap.set('v', 'k', 'gk')

-- Enter to clear search highlight
keymap.set('n', '<cr>', ':noh<cr><cr>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Delete and visual replace without replacing clipboard
keymap.set('v', 'p', '"+P')

-- Copy current file path to clipboard
keymap.set('n', '<Leader>fp', ':let @*=expand("%:p")<cr>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d');

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true });
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w');
keymap.set('n', '<S-Space>', '<C-w>p');
keymap.set('', 'sh', '<C-w>h');
keymap.set('', 'sj', '<C-w>j');
keymap.set('', 'sk', '<C-w>k');
keymap.set('', 'sl', '<C-w>l');

-- Resize window
keymap.set('n', 's<left>', '<C-w>5>')
keymap.set('n', 's<right>', '<C-w>5<')
keymap.set('n', 's<up>', '<C-w>5+')
keymap.set('n', 's<down>', '<C-w>5-')

-- Disable trackpad from horizontally scorlling
keymap.set('n', '<ScrollWheelLeft>', '<nop>');
keymap.set('n', '<ScrollWheelRight>', '<nop>');

-- tpope/fugitive mappings

-- white people are uncomfortable with saying the word 'master' in front of black people so they
-- sometimes rename a repo default branch from master to main. Thus, this bullshit becomes necessary
function default_branch()
  return vim.fn.system([[git branch -l master main | sed 's/^* //' | tr -d '[:space:]']])
end

vim.keymap.set('n', '<leader>gm', function()
  -- Git diff master:% %
  vim.api.nvim_command('Git diff ' .. default_branch() .. ':% %')
end)
