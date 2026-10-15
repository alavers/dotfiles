return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>gj",
        function()
          require("gitsigns").nav_hunk("next", { navigation_message = false })
        end,
        desc = "Next Hunk",
      },
      {
        "<leader>gk",
        function()
          require("gitsigns").nav_hunk("prev", { navigation_message = false })
        end,
        desc = "Prev Hunk",
      },
    },
  },
}
