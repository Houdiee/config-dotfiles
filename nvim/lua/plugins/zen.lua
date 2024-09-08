return {
  {
    "folke/zen-mode.nvim",
    opts = {
      kitty = { enabled = true },
    },
    config = function() vim.keymap.set("n", "<C-z>", "<cmd>ZenMode<CR>", { silent = true }) end,
  },
}
