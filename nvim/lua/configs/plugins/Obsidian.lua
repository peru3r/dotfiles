return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,

    ui = {
      enable = true,
    },

    workspaces = {
      {
        name = "iCloud",
        path = "/Users/peru3re/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault",
      },
      {
        name = "notes",
        path = "~/notes",
      },
    },
  },

  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}
