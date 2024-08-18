local cmp = require("cmp")
local keymaps = require("lazyvim.plugins.lsp.keymaps")

local function configure_cmp()
  cmp.setup({
    mapping = {
      ["<CR>"] = cmp.config.disable,
      ["<S-k>"] = cmp.config.disable,
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<Tab>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    },
  })
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = configure_cmp,
})

return {
  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        keymaps = false,
      },
      inlay_hints = { enabled = false },
    },

    keys = {
      { "<S-k>", false },
    },
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
  },
}
