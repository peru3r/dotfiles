return {
  {
    "Pocco81/auto-save.nvim",
    opts = {
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        -- не трогаем harpoon и немодифицируемые буферы
        if
          fn.getbufvar(buf, "&modifiable") == 1
          and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" })
        then
          return true
        end

        return false
      end,
    },
    config = function(_, opts)
      require("auto-save").setup(opts)
    end,
  },
}
