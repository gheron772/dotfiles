local M = {}

M.general = {
  n = {
    ["<F8>"] = { function() require("aerial").toggle({ focus = false }) end, "Symbols outline" },
  },
  v = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  }
}

M.flutter_tools = {
  plugin = true,

  n = {
    ["<F8>"] = { "<Cmd>FlutterOutlineToggle<CR>", "Flutter outline toggle" },
  }
}

return M
