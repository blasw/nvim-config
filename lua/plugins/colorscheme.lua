-- require("catppuccin").setup({
--   transparent_background = true,
-- })

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_background = true },
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end,
  },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_mode = true,
      transparent_background = true,
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
      -- colorscheme = "tokyodark",
      -- colorscheme = "rose-pine",
    },
  },
}
