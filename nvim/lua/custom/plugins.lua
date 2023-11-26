local lsp = require("plugins.configs.lspconfig")
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.lspconfig"
    end,
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
          on_attach = lsp.on_attach,
          capabilities = lsp.capabilities
        },
      }
      require("core.utils").load_mappings("flutter_tools")
    end,
  }
}

return plugins
