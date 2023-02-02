return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	keys = {
		{ "<leader>n", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
}
