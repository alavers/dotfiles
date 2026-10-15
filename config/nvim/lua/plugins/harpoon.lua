return {
  {
    "ThePrimeagen/harpoon",
    branch = "master", -- Keep the legacy API used by these mappings.
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon Add File" },
      { "<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon Menu" },
      { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon File 1" },
      { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon File 2" },
      { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon File 3" },
      { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon File 4" },
    },
  },
}
