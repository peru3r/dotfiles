return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "python",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
      },
    },

    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
