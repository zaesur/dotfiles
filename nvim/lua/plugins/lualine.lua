return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        theme = "dracula"
      }
    })

    vim.api.nvim_create_autocmd({ "User"}, {
      pattern = "GoyoEnter",
      callback = function()
        lualine.hide()
      end
    })

    vim.api.nvim_create_autocmd({ "User"}, {
      pattern = "GoyoLeave",
      callback = function()
        lualine.hide({ unhide = true })
      end
    })
  end
}
