local custom_lsp = require "custom.configs.lspconfig"
local plugins = {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "deno",
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        filter_kind = false,
        show_guides = true,
      })
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {
        lsp = {
          on_attach = custom_lsp.on_attach,
          capabilities = custom_lsp.capabilities
        },
      }
      require("core.utils").load_mappings("flutter_tools")
    end,
  }
}

return plugins
