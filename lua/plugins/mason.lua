return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"csharp_ls",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					"eslint",
					"html",
					"jsonls",
					"tsserver",
					"prosemd_lsp",
					"jedi_language_server",
					"sqlls",
					"stylelint_lsp",
					"svelte",
					"tailwindcss",
					"volar",
					"gitlab_ci_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.csharp_ls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.dockerls.setup({
				settings = {
					docker = {
						languageserver = {
							formatter = {
								ignoreMultilineInstructions = true,
							},
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
