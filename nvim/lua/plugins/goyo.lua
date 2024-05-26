return {
  {
    "junegunn/goyo.vim",
    config = function()
      vim.keymap.set("n", "<leader>zz", ":Goyo<CR>" , {})
    end
  },
  {
    "junegunn/limelight.vim",
    config = function()
      vim.api.nvim_create_autocmd({ "User" }, { pattern = "GoyoEnter", command = "Limelight"})
      vim.api.nvim_create_autocmd({ "User" }, { pattern = "GoyoLeave", command = "Limelight!"})
    end
  }
}
