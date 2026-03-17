return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G" },
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
		{ "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
	}
}
