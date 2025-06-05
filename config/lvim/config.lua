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
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    ft = { "fugitive" }
  },
  'tpope/vim-rhubarb',
  'benfowler/telescope-luasnip.nvim',

  -- Theme
  "ellisonleao/gruvbox.nvim",

  -- Go
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",

  -- live_grep with ripgrep args
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  { "github/copilot.vim" },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "zendesk",
      vendors = {
        zendesk = {
          api_key_name = "OPENAI_API_KEY",
          endpoint = "https://ai-gateway.zende.sk/v1/",
          model = "gpt-4o",
          -- model = "claude-3.5-sonnet",
          __inherited_from = "openai",
        },
      },
      -- provider = "copilot",
      -- endpoint = "https://ai-gateway.zende.sk/v1",
      -- model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)

      -- provider = "openai",
      -- openai = {
      --   endpoint = "https://ai-gateway.zende.sk/v1",
      --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      --   temperature = 0,
      --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}

vim.opt.relativenumber = true
vim.opt.spell = true
lvim.colorscheme = "gruvbox"

-- Quickfix window Toggler
-- https://www.reddit.com/r/neovim/comments/ol2vx4/how_to_toggle_quickfix_with_lua/
_G.toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

_G.toggle_qf_height = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      if (win["height"] >= 40) then
        vim.cmd "copen 10"
      else
        vim.cmd "copen 40"
      end
    end
  end
end

-- Binds https://www.lunarvim.org/docs/configuration/keybindings
--
------------------------
-- Key binds
------------------------

-- Quickfix window
lvim.builtin.which_key.mappings["z"] = { "<cmd>lua toggle_qf()<cr>", "Toggle Quickfix" }
lvim.builtin.which_key.mappings["x"] = { "<cmd>lua toggle_qf_height()<cr>", "Toggle Quickfix Height" }

-- Disable horizontal trackpad scrolling
lvim.keys.normal_mode["<ScrollWheelLeft>"] = "<nop>"
lvim.keys.normal_mode["<ScrollWheelRight>"] = "<nop>"
lvim.keys.insert_mode["<ScrollWheelLeft>"] = "<nop>"
lvim.keys.insert_mode["<ScrollWheelRight>"] = "<nop>"

-- save with ,,
lvim.keys.normal_mode[",,"] = ":w<cr>"

-- Delete and visual replace without replacing clipboard
lvim.keys.visual_mode["p"] = '"+P'

-- CoPilot, use C-J instead of <Tab> for accepting suggestions
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-G>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})


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

-- better find files
lvim.builtin.which_key.mappings["f"] = {
  "<cmd>Telescope find_files<cr>",
  "Find files"
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

-- live_grep with ripgrep options
lvim.builtin.which_key.mappings["s"]["a"] = {
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
  "Live grep with args"
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

-- Organize imports via LSP
-- lvim.lsp.buffer_mappings.normal_mode.go["1"] = "<cmd>lua vim.lsp.buf.organize_imports()<cr>"
-- lvim.lsp.buffer_mappings.normal_mode.go["2"] = "organize imports"

------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "gomod",
}

------------------------
-- Linting
------------------------
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact" } }
}

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt",   filetypes = { "go" } },
  { name = "prettierd",    filetypes = { "javascript", "typescript", "typescriptreact", "json" } }
}

-- Toggle with LvimToggleFormatOnSave
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.lua", "*.go", "*.js", "*.ts" }
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

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

require('lspconfig').tsserver.setup({
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'relative',
      importModuleSpecifierEnding = 'minimal',
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
})

lvim.builtin.which_key.mappings["l"]["o"] = {
  "<cmd>OrganizeImports<cr>",
  "Organize Imports"
}

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
