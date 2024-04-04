return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use "ellisonleao/gruvbox.nvim"
	use 'folke/tokyonight.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'},
		}
	}

	use 'nvim-lualine/lualine.nvim'

	use 'mbbill/undotree'

	use 'brneor/gitui.nvim'

	use {
		'numToStr/Comment.nvim',
	}

	use "folke/trouble.nvim"
	use "nvim-tree/nvim-web-devicons"
end)


