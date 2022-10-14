vim.keymap.set('s', '<C-L>', '<cmd>lua require"luasnip".jump(1)<cr>', { silent = true })
vim.keymap.set('s', '<C-H>', '<cmd>lua require"luasnip".jump(-1)<cr>', { silent = true })
vim.keymap.set('i', '<C-L>', '<cmd>lua require"luasnip".jump(1)<cr>', { silent = true })
vim.keymap.set('i', '<C-H>', '<cmd>lua require"luasnip".jump(-1)<cr>', { silent = true })

-- https://github.com/rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load({ paths = { '~/.config/nvim/snippets' } })
