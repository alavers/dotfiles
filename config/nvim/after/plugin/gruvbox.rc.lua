local status, gruvbox = pcall(require, 'gruvbox')
if (not status) then return end

local colors = {
  dark1 = "#332e2c",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  bright_red = "#f2594b",
  bright_green = "#b0b846",
  bright_yellow = "#e9b143",
  bright_blue = "#80aa9e",
  bright_purple = "#d3869b",
  bright_aqua = "#8bba7f",
  bright_orange = "#f28d3a",
  dark_blue = "#425751",
  darkest_red = "#381310",
  darkest_green = "#353814",
  darkest_blue = "#2b3835",
}

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    operators = true,
    comments = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  -- Preserve syntax highlights in diffview.nvim
  overrides = {
    DiffChange = { bg = colors.darkest_blue, fg = "None", reverse = false },
    DiffAdd = { bg = colors.darkest_green, fg = "None", reverse = false },
    DiffDelete = { bg = colors.darkest_red, fg = "None", reverse = false },
    DiffText = { bg = colors.dark_blue, fg = "None", reverse = false },
    GruvboxRedUnderline = { undercurl = true, sp = colors.bright_red },
  },
  dim_inactive = false,
  transparent_mode = false,
  -- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua
  palette_overrides = {
    -- dark1 = colors.dark1,
    -- dark2 = colors.dark2,
    -- dark3 = colors.dark3,
    -- dark4 = colors.dark4,
    -- bright_red = colors.bright_red,
    -- bright_green = colors.bright_green,
    -- bright_yellow = colors.bright_yellow,
    -- bright_blue = colors.bright_blue,
    -- bright_purple = colors.bright_purple,
    -- bright_aqua = colors.bright_aqua,
    -- bright_orange = colors.bright_orange,
  },
})
vim.cmd('colorscheme gruvbox')
