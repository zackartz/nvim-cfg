return {
	{
	 -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},

	-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{ "kevinhwang91/nvim-ufo",                    dependencies = "kevinhwang91/promise-async" },

	{
		"Saecki/crates.nvim",
		config = function()
			require("crates").setup()
		end,
	},

	"folke/zen-mode.nvim",

	-- "ellisonleao/gruvbox.nvim",

	{
		"Shatur/neovim-ayu",
		config = function()
			require("ayu").setup({
				mirage = false,
				overrides = {},
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavor = "frappe",
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					-- noice = true,
				},
				transparent_background = false,
				highlight_overrides = {
					all = function(colors)
						return {
							PmenuSel = { bg = colors.maroon, fg = "NONE" },
							CmpItemKindField = { fg = colors.crust, bg = colors.flamingo },
							CmpItemKindProperty = { fg = colors.crust, bg = colors.mauve },
							CmpItemKindEvent = { fg = colors.crust, bg = colors.maroon },
							CmpItemKindText = { fg = colors.crust, bg = colors.subtext1 },
							CmpItemKindEnum = { fg = colors.crust, bg = colors.red },
							CmpItemKindKeyword = { fg = colors.crust, bg = colors.peach },
							CmpItemKindConstant = { fg = colors.crust, bg = colors.yellow },
							CmpItemKindConstructor = { fg = colors.crust, bg = colors.sapphire },
							CmpItemKindReference = { fg = colors.crust, bg = colors.teal },
							CmpItemKindFunction = { fg = colors.crust, bg = colors.sky },
							CmpItemKindStruct = { fg = colors.crust, bg = colors.pink },
							CmpItemKindClass = { fg = colors.crust, bg = colors.pink },
							CmpItemKindModule = { fg = colors.crust, bg = colors.teal },
							CmpItemKindOperator = { fg = colors.crust, bg = colors.sky },
							CmpItemKindVariable = { fg = colors.crust, bg = colors.rosewater },
							CmpItemKindFile = { fg = colors.crust, bg = colors.subtext2 },
							CmpItemKindUnit = { fg = colors.crust, bg = colors.subtext2 },
							CmpItemKindSnippet = { fg = colors.crust, bg = colors.green },
							CmpItemKindFolder = { fg = colors.crust, bg = colors.subtext1 },
							CmpItemKindMethod = { fg = colors.crust, bg = colors.sky },
							CmpItemKindValue = { fg = colors.crust, bg = colors.rosewater },
							CmpItemKindEnumMember = { fg = colors.crust, bg = colors.pink },
							CmpItemKindInterface = { fg = colors.crust, bg = colors.red },
							CmpItemKindColor = { fg = colors.crust, bg = colors.overlay2 },
							CmpItemKindTypeParameter = { fg = colors.crust, bg = colors.mauve },
						}
					end,
				},
			})
		end,
	},

	"simrat39/rust-tools.nvim",

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
	 -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
		},
	},

	{
	 -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.eslint,
				},
			})
		end,
	},

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",

	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	"numToStr/Comment.nvim",              -- "gc" to comment visual regions/lines
	"tpope/vim-sleuth",                   -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim",            branch = "0.1.x",                           dependencies = {
		"nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make",                             cond = vim.fn.executable(
	"make") == 1 },
}
