return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local colors = {
				blue   = '#036A96',
				cyan   = '#80FFEA',
				black  = '#22212C',
				white  = '#F8F8F2',
				red    = '#FF9580',
				violet = '#9580ff',
				grey   = '#7970A9',
			}

			--local bubbles_theme = {
			local dracula = {
				normal = {
					a = { fg = colors.black, bg = colors.violet },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.white },
				},

				insert = { a = { fg = colors.black, bg = colors.cyan } },
				visual = { a = { fg = colors.white, bg = colors.blue } },
				replace = { a = { fg = colors.white, bg = colors.red } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.white },
				},
			}
			require('lualine').setup({
				options = {
					globalstatus = true,
					icons_enabled = true,
					--theme = bubbles_theme,
					theme = dracula,
					component_separators = '',
					--section_separators = { left = '', right = '' },
				},
				sections = {
					--lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
					lualine_b = { 'filename', 'branch' },
					lualine_c = {
						'%=', --[[ add your center compoentnts here in place of this comment ]]
					},
					lualine_x = {},
					lualine_y = { 'filetype', 'progress' },
					--lualine_z = {
					--	{ 'location', separator = { right = '' }, left_padding = 2 },
					--},
				},
				inactive_sections = {
					lualine_a = { 'filename' },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { 'location' },
				},
				tabline = {},
				extensions = {},
			})
		end
	}
}
