return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	local lualine = require("lualine")

	local colors = {
	  blue = "#61AFEF",
	  green = "#98C379",
	  violet = "#C678DD",
	  yellow = "#E5C07B",
	  red = "#E06C75",
	  fg = "#ABB2BF",
	  bg = "#282C34",
	  inactive_bg = "#3E4451",
	}


	local my_lualine_theme = {
      	  normal = {
            a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
	        },
          insert = {
            a = { bg = colors.green, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
	  visual = {
            a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
      	  },
      	  command = {
            a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          replace = {
            a = { bg = colors.red, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          inactive = {
            a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
            b = { bg = colors.inactive_bg, fg = colors.semilightgray },
            c = { bg = colors.inactive_bg, fg = colors.semilightgray },
          },
        }
      lualine.setup({
	options = {
	  theme = my_lualine_theme,
	  },
	})
    end,
}
