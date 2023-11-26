local M = {}

M.general = {
  n = {
    ["<F8>"] = { function() require("aerial").toggle({ focus = false }) end, "Symbols outline" },
  }
}

M.flutter_tools = {
  plugin = true,

  n = {
    ["<F8>"] = { "<Cmd>FlutterOutlineToggle<CR>", "Flutter outline toggle" },
  }
}

return M
