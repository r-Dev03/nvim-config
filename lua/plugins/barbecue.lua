return
{
    "utilyre/barbecue.nvim",
    event = "BufAdd",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("barbecue").setup({
        show_dirname = false,
        symbols = {
          separator = "",
        },
        theme = "aki",
      })
    end,
}
