local M = {}

M.opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, M.opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, M.opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, M.opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, M.opts)

M.on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	require('lsp_signature').on_attach()
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

M.lsp_flags = {
	debounce_text_changes = 150,
}

require('lspconfig')['sumneko_lua'].setup {
	on_attach = M.on_attach,
	flags = M.lsp_flags,
	settings = {
		Lua = {
			completion = {
				callSnippet = 'Replace',
			},
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

return M
