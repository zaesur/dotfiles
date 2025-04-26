return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    files = {
      previewer = true,
      multiprocess = true,
      git_icons = true,
    },
  },
  keys = {
    { "<C-p>", function() require("fzf-lua").files() end, mode = { "n", "i" }, desc = "fzf browse files" },
    { "<C-f>", function() require("fzf-lua").live_grep() end, mode = { "n" }, desc = "fzf search project" },
  }
}
