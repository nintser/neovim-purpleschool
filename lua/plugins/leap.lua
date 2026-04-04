return {
  url = "https://codeberg.org/andyg/leap.nvim",
  lazy = false,
  config = function()
    require("leap").setup({})
  end,
}
