return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"pyright",
				"taplo",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("neodev").setup() -- For NeoVim development

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				-- For NeoVim development
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
					},
				},
			})

			lspconfig.taplo.setup({
				capabilities = capabilities,
				settings = {
					evenBetterToml = {
						schema = {
							associations = {
								["pyproject\\.toml"] = "https://json.schemastore.org/pyproject.json",
							},
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "rs", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		debug = true,
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		config = function()
			-- Eslint: https://github.com/nvimtools/none-ls-extras.nvim
			local null_ls = require("null-ls")
			local eslint_diagnostics = require("none-ls.diagnostics.eslint_d")
			local eslint_code_actions = require("none-ls.code_actions.eslint_d")

			local node_modules = "node_modules/.bin"
			local check_configuration = function(utils)
				return true -- utils.root.has_file_matches("eslint")
			end

			null_ls.setup({
				sources = {
					-- Lua
					null_ls.builtins.formatting.stylua,

					-- Python
					null_ls.builtins.formatting.black.with({
						extra_args = { "--line-length=120" },
					}),

					-- Prettier
					null_ls.builtins.formatting.prettier.with({
						prefer_local = node_modules,
					}),

					-- Eslint
					eslint_diagnostics.with({
						condition = check_configuration,
						prefer_local = node_modules,
					}),

					eslint_code_actions.with({
						condition = check_configuration,
						prefer_local = node_modules,
					}),
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
