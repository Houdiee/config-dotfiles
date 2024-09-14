-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true,
      notifications = true,
    },

    diagnostics = {
      virtual_text = true,
      underline = true,
    },

    options = {
      opt = { -- vim.opt.<key>
        clipboard = "",
        relativenumber = true,
        scrolloff = 8,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = true,
        hlsearch = false,
        swapfile = false,
        backup = false,
        undodir = os.getenv "HOME" .. "/.vim/undodir",
        undofile = true,
        list = true,
        listchars = { tab = "  ", trail = "·", nbsp = "␣" },
      },
      g = { -- vim.g.<key>
        undotree_WindowLayout = 2,
        undotree_DiffpanelHeight = 15,
        undotree_SetFocusWhenToggle = 1,
      },
    },

    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      -- second key is the lefthand side of the map
      n = {
        ["<C-n>"] = { "<cmd>Neotree toggle position=current<CR>", desc = "Netrw" },

        ["<Leader>sv"] = { "<cmd>vsplit<CR>", desc = "Vertical" },
        ["<Leader>sh"] = { "<cmd>split<CR>", desc = "Horizontal" },

        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },

        ["<Leader>U"] = { "<cmd>UndotreeToggle<CR>", desc = "Undotree" },

        ["<Leader>W"] = { "<cmd>wqa<CR>", desc = "Save all and quit" },

        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },
        ["<leader>s"] = { desc = "Split" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },

      v = {
        ["<C-c>"] = { '"+y' },

        [">"] = { ">gv" },
        ["<"] = { "<gv" },

        ["<S-j>"] = { ":m '>+1<CR>gv=gv" },
        ["<S-k>"] = { ":m '<-2<CR>gv=gv" },
      },

      i = {
        ["<C-h>"] = { "<left>" },
        ["<C-j>"] = { "<down>" },
        ["<C-l>"] = { "<right>" },
        ["<C-k>"] = { "<up>" },
      },

      x = {
        ["<leader>r"] = { '"_dP', desc = "Replace" },
      },
    },
  },
}
