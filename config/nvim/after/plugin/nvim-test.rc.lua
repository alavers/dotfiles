local status, nt = pcall(require, 'nvim-test')
if (not status) then return end

nt.setup({
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96, -- terminal's width (for vertical|float)
    height = 24, -- terminal's height (for horizontal|float)
    go_back = false, -- return focus to original window after executing
    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  },
  runners = { -- setup tests runners
    typescript = "nvim-test.runners.ts-mocha",
  }
})

require('nvim-test.runners.ts-mocha'):setup {
  command = { "./node_modules/.bin/ts-mocha", "ts-mocha" },
  args = { "--opts", "./src/test/mocha.opts" },
  file_pattern = "\\v(tests?/.*|test)\\.(ts|tsx)$",
  find_files = { "{name}.test.{ext}" },
}

vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<cr>')
vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<cr>')
