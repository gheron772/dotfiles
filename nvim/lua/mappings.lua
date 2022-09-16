local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

vim.keymap.set({ 'i', 's' }, '<C-n>', '<nop>', opts)
vim.keymap.set({ 'i', 's' }, '<C-p>', '<nop>', opts)

vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

vim.keymap.set('n', '<leader>x',
	function()
		local bufn = vim.api.nvim_get_current_buf()
		vim.cmd('BufferLineCyclePrev')
		vim.cmd('confirm bd' .. bufn)
	end,
	opts
)

vim.keymap.set('n', '<F8>', ':FlutterOutlineToggle<CR>', opts)
