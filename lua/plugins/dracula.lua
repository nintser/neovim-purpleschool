return {
	"binhtran432k/dracula.nvim",
	config = function()
		require('dracula').setup({
			lazy = false,
			priority = 1000,
			opts = {},
			style = "default",
			transparent = true,
			use_background = true,
		})
		require('dracula').load()
	end
}
