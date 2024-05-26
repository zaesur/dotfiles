return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local nt = require("neo-tree.command")

    vim.keymap.set("n", "<C-n>", function()
      nt.execute({ position = "left", toggle = true, reveal = true })
    end, {})
  end,
}
