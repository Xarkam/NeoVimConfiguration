return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		local config = require("catppuccin")
		config.setup({
			transparent_background = false,
			term_colors = true,
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
