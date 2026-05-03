return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "dawn",
      dark_variant = "moon",
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    })
    vim.cmd("colorscheme rose-pine-dawn")
  end,
}
