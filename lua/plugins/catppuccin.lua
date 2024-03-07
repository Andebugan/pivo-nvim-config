return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = "mocha",
      term_colors = true,
      transparent_background=false,
      color_overrides = {
				mocha = {
					base = "#1c1001",
				},
			},
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
