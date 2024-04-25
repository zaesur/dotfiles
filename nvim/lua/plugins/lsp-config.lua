return {
  -- {
  --   "williamboman/mason.nvim",
  --   config = function()
  --     require("mason").setup()
  --   end
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       -- ensure_installed = { "lua_ls", "tsserver" }
  --     })
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.nil_ls.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      -- { '[d', vim.diagnostic.goto_prev },
      -- { ']d', vim.diagnostic.goto_next },
      -- { ' ' , vim.lsp.buf.hover },
      -- { ' s', vim.lsp.buf.signature_help },
      -- { ' d', vim.diagnostic.open_float },
      -- { ' q', vim.diagnostic.setloclist },
      -- { '\\r', vim.lsp.buf.rename },
      -- { '\\a', vim.lsp.buf.code_action },
    end,
  },
}
