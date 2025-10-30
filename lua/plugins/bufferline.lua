return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			local bufferline = require("bufferline")
			local gray = "#585b70"
			local links = "#454158"

			bufferline.setup({
				options = {
					mode = "buffers",
					numbers = "none",
					color_icons = false,
					indicator = {
						icon = '/ ',
						style = "underline",
					},
					modified_icon = "●",
					left_trunc_marker = "",
					right_trunc_marker = "",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local s = " "
						for e, _ in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or " ")
							s = s .. sym
						end
						return s
					end,
					always_show_bufferline = true,
					offsets = {
						{
							filetype = "NvimTree",
							text = function()
								return vim.fn.getcwd()
							end,
							-- highlight = "Directory",
							text_align = "left",
							-- separator = true
						}
					}
				},
				highlights = {
					background = {
						fg = "#22212C",
					},
					buffer_selected = {
						fg = "#9580FF",
					},
					buffer_visible = {
						fg = "#9580FF",
					},
					separator = {
						bg = "#44475a",
						fg = "#44475a",
					},
					diagnostic = {},
				},

			})
		end,
	}
}
