return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        -- or
        -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" 
      },
    },

    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find buffers" },
        { "<leader>bd", "<cmd>bdelete<CR>",              desc = "Delete buffer" },
        { "<leader>gf", "<cmd>Telescope git_files<CR>",  desc = "Git files" },
        { "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Grep string",
        },
    },

    opts = {},
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}

