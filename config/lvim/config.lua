-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

------------------------
-- Plugins
-- Sample configurations https://www.lunarvim.org/docs/configuration/plugins/example-configurations
-- Go starter https://github.com/LunarVim/starter.lvim/blob/go-ide/README.md
-- More examples https://www.lunarvim.org/docs/faq#where-can-i-find-some-example-configs
------------------------

lvim.plugins = {
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')
      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<leader>m', ui.toggle_quick_menu)
      vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
      vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
      vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
      vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
    end
  },

  'tpope/vim-surround',
  'benfowler/telescope-luasnip.nvim',

  -- Theme
  "ellisonleao/gruvbox.nvim",

  -- Go
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
}

vim.opt.relativenumber = true
lvim.colorscheme = "gruvbox"

-- Binds https://www.lunarvim.org/docs/configuration/keybindings
--
------------------------
-- Key binds
------------------------

-- Disable horizontal trackpad scrolling
lvim.keys.normal_mode["<ScrollWheelLeft>"] = "<nop>"
lvim.keys.normal_mode["<ScrollWheelRight>"] = "<nop>"
lvim.keys.insert_mode["<ScrollWheelLeft>"] = "<nop>"
lvim.keys.insert_mode["<ScrollWheelRight>"] = "<nop>"

-- save with ,,
lvim.keys.normal_mode[",,"] = ":w<cr>"

------------------------
-- Telescope config
------------------------

-- https://gitlab.com/lostneophyte/dotfiles/-/blob/5d49006532bf57db9f7e09564cb43010f631c571/lvim/.config/lvim/lua/user/telescope.lua
lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope.defaults.layout_config = {
  prompt_position = "top",
  height = 0.9,
  width = 0.9,
  horizontal = {
    preview_width = 0.5,
  },
  vertical = {
    preview_cutoff = 40,
  },
  flex = {
    flip_columns = 150,
  },
}

-- snippets with telescope
lvim.builtin.which_key.mappings["s"]["s"] = {
  "<cmd>lua require('telescope').extensions.luasnip.luasnip{}<cr>",
  "Snippets"
}

-- git_files
lvim.builtin.which_key.mappings["s"]["g"] = {
  "<cmd>Telescope git_files<cr>",
  "Git files"
}

-- better find files
lvim.builtin.which_key.mappings["f"] = {
  "<cmd>Telescope find_files<cr>",
  "Find files"
}

-- file symbols
lvim.builtin.which_key.mappings["s"]["d"] = {
  "<cmd>Telescope lsp_document_symbols<cr>",
  "Document symbols"
}

-- Which key binds
lvim.builtin.which_key.mappings["b"]["o"] = {
  "<cmd>BufferLineCloseOthers<cr>",
  "Close others"
}

local telescope = require('telescope.builtin')
vim.api.nvim_create_user_command(
  'Ack',
  function(opts)
    telescope.live_grep({ default_text = opts.args, initial_mode = 'normal' })
  end,
  { desc = 'Send given string to telescope live_grep', nargs = 1 }
)


-- Tab through buffers
lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<CR>"

------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "gomod",
}

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt",   filetypes = { "go" } },
  { name = "prettier", filetypes = { "javascript", "typescript", "typescriptreact" } }
}

lvim.format_on_save = {
  enabled = true,
  pattern = "*.go",
}

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

------------------------
-- LSP
------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end
    map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
    map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
    map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
    map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
    map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
    map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
    map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
    map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
    map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}
