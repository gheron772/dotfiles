return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim', config = function() require('plugins') end }
	use { 'nvim-lua/plenary.nvim' }

	-- frame
	use { 'folke/tokyonight.nvim', config = function() vim.cmd [[colorscheme tokyonight]] end }
	use {
		{
			'nvim-lualine/lualine.nvim',
			config = function() require('lualine').setup({ options = { globalstatus = true } }) end
		},
		{
			'akinsho/bufferline.nvim',
			config = function() vim.opt.termguicolors = true require("bufferline").setup {} end,
			requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}
	}

	-- lsp
	use { 'neovim/nvim-lspconfig', config = function() require('lsp') end }
	use { 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function() require('nvim-treesitter.configs').setup({ highlight = { enable = true } }) end
	}
	use {
		'akinsho/flutter-tools.nvim',
		ft = 'dart',
		config = function() require('flutter-tools').setup({ lsp = { on_attach = require('lsp').on_attach } }) end
	}

	-- completion
	use { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }
	use { 'hrsh7th/nvim-cmp', after = 'friendly-snippets', config = function() require('cmp_cfg') end }
	use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' }
	use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
	use { 'hrsh7th/cmp-nvim-lua', after = 'cmp_luasnip' }
	use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
	use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }

	-- misc
	use { 'lukas-reineke/indent-blankline.nvim' }
	use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
	use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
	use {
		'kyazdani42/nvim-tree.lua',
		cmd = { 'NvimTreeToggle' },
		config = function() require('nvim-tree').setup() end
	}

	use { 'lewis6991/impatient.nvim', config = function() require('impatient') end }
end)
