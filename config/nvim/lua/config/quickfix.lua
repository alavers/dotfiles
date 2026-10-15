-- Quickfix window helpers and mappings.
local function toggle_qf()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd.cclose()
      return
    end
  end

  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  end
end

local function toggle_qf_height()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd.copen(win.height >= 40 and 10 or 40)
      return
    end
  end
end

vim.keymap.set("n", "<leader>z", toggle_qf, { desc = "Toggle Quickfix" })
vim.keymap.set("n", "<leader>xc", toggle_qf_height, { desc = "Toggle Quickfix Height" })
