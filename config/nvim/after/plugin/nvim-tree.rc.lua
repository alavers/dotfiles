local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
})


vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>NvimTreeFindFile<cr>')
