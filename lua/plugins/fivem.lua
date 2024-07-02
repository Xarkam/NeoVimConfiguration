return {
	"Z3rio/FiveM.nvim",
    enabled = false,

	config = function()
		require("fivem").setup({
			debug = true,
		})
	end,

	dependencies = {
		"rcarriga/nvim-notify",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},

	lazy = false,
}
