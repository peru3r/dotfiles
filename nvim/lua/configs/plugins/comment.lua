return {
  {
    "nvim-mini/mini.comment",
    opts = {
      options = {
        pad_comment_parts = true,
      },
      mappings = {
        comment = "<leader>cc",
        comment_line = "<leader>cc",
        comment_visual = "<leader>c",
        textobject = "",
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}
