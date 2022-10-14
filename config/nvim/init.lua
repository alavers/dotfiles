require('base')
require('highlights')
require('maps')
require('plugins')
require('toggle_qf')

local is_mac = vim.fn.has "macunix"
local is_win = vim.fn.has "win32"

if is_mac then
  require('macos')
end

if is_win then
  require('windows');
end
