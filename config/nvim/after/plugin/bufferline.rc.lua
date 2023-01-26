local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local status2, close_buffers = pcall(require, 'close_buffers')
if (not status2) then return end

bufferline.setup({
  options = {
    close_command = 'BDelete this',
    right_mouse_command = 'BDelete this',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } }
  },
  highlights = {
    separator = {
      fg = '#504945',
      bg = '#3c3836'
    },
    separator_selected = {
      fg = '#504945',
      bg = '#1d2021'
    },
    separator_visible = {
      fg = '#504945',
      bg = '#3c3836'
    },
    background = {
      fg = '#a89983',
      bg = '#3c3836'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bg = '#1d2021',
      bold = true,
    },
    buffer_visible = {
      bg = '#3c3836',
    },
    fill = {
      bg = '#504945'
    },
    modified = {
      bg = '#3c3836'
    },
    modified_selected = {
      bg = '#1d2021'
    },
    modified_visible = {
      bg = '#3c3836'
    },
    duplicate = {
      bg = '#3c3836'
    },
    duplicate_selected = {
      bg = '#1d2021'
    },
    duplicate_visible = {
      bg = '#3c3836'
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

vim.keymap.set('n', '<leader>w', '<Cmd>BDelete! this<CR>')
vim.keymap.set('n', '<leader>W', '<Cmd>BWipeout other<CR>')
