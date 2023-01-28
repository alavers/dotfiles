local status, gruvbox = pcall(require, 'gruvbox')
if (not status) then return end

gruvbox.setup({
  undercurl = false,
  underline = false,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
  -- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua
  palette_overrides = {
    bright_red = "#f2594b",
    bright_green = "#b0b846",
    bright_yellow = "#e9b143",
    bright_blue = "#80aa9e",
    bright_purple = "#d3869b",
    bright_aqua = "#8bba7f",
    bright_orange = "#f28d3a",
  }
})
vim.cmd('colorscheme gruvbox')
