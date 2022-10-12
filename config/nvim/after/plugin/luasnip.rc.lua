vim.keymap.set('s', '<Tab>', '<cmd>lua require"luasnip".jump(1)<cr>', { silent = true })
vim.keymap.set('s', '<S-Tab>', '<cmd>lua require"luasnip".jump(-1)<cr>', { silent = true })
vim.keymap.set('i', '<Tab>', '<cmd>lua require"luasnip".jump(1)<cr>', { silent = true })
vim.keymap.set('i', '<S-Tab>', '<cmd>lua require"luasnip".jump(-1)<cr>', { silent = true })

-- https://github.com/rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load({ paths = { '~/.config/nvim/snippets' } })
