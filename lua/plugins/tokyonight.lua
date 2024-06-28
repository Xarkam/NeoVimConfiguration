return {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local config = require("tokyonight")
		config.setup({
			style = "storm",
			transparent = false,
			terminal_colors = true,
		})
		-- load the colorscheme here
		-- vim.cmd([[colorscheme tokyonight]])
	end,
}
