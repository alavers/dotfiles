local function yank_relative_paths(picker)
  if vim.fn.mode():find("^[vV]") then
    picker.list:select()
  end

  local paths = {}
  for _, item in ipairs(picker:selected({ fallback = true })) do
    local path = Snacks.picker.util.path(item)
    local relative = path and vim.fs.relpath(picker:cwd(), path)
    if relative then
      paths[#paths + 1] = relative
    end
  end

  picker.list:set_selected()
  if #paths == 0 then
    return
  end

  vim.fn.setreg(vim.v.register or "+", table.concat(paths, "\n"), "l")
  Snacks.notify.info("Yanked " .. #paths .. " relative paths")
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      picker = {
        sources = {
          explorer = {
            actions = { yank_relative_paths = yank_relative_paths },
            win = {
              list = {
                keys = {
                  ["Y"] = { "yank_relative_paths", mode = { "n", "x" }, desc = "Yank Relative Path" },
                },
              },
            },
          },
        },
      },
    },
  },
}
