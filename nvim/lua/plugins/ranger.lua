return {
  {
    "kelly-lin/ranger.nvim",
    config = function()
      local ranger_nvim = require "ranger-nvim"
      require("ranger-nvim").setup {
        enable_cmds = false,
        replace_netrw = false,

        keybinds = {
          ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
          ["oh"] = ranger_nvim.OPEN_MODE.split,
          ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
          ["or"] = ranger_nvim.OPEN_MODE.rifle,
        },

        ui = {
          border = "rounded",
          height = 0.8,
          width = 0.8,
          x = 0.5,
          y = 0.5,
        },
      }

      vim.api.nvim_set_keymap("n", "<leader>r", "", {
        desc = "Ranger",
        noremap = true,
        callback = function() require("ranger-nvim").open(true) end,
      })
    end,
  },
}
