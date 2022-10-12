local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local status2, close_buffers = pcall(require, 'close_buffers')
if (not status2) then return end

bufferline.setup({
  options = {
    close_command = 'BDelete this',
    right_mouse_command = 'BDelete this',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    indicator = {
      style = 'underline'
    }
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '‘', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '“', '<Cmd>BufferLineCyclePrev<CR>', {})

vim.keymap.set('n', '¡', '<Cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '™', '<Cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '£', '<Cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '¢', '<Cmd>BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '∞', '<Cmd>BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '§', '<Cmd>BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '¶', '<Cmd>BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '•', '<Cmd>BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', 'ª', '<Cmd>BufferLineGoToBuffer 9<CR>')

vim.keymap.set('n', '≤', '<Cmd>BufferLineMovePrev<CR>')
vim.keymap.set('n', '≥', '<Cmd>BufferLineMoveNext<CR>')

vim.keymap.set('n', '<leader>w', '<Cmd>BDelete this<CR>')
vim.keymap.set('n', '<leader>W', '<Cmd>BWipeout other<CR>')
