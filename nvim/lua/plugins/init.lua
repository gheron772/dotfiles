return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy"
  },

  {
    url = "https://codeberg.org/andyg/leap.nvim",
    opts = {
      safe_labels = '',
      preview = false
    },
    event = "VeryLazy"
  }
}
