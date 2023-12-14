local M = {}
local configs = require("plugins.configs.lspconfig")

M.on_attach = function(client, bufnr)
  configs.on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end
M.capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "denols", "lua_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
end

return M
