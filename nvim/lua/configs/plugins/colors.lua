return {
	{
		"vossenwout/guts.nvim",
		lazy = false,
		config = function()
		    vim.cmd.colorscheme("guts")

		    -- transparent bg
		    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
		    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		end,
	},

	{ 
		"blazkowolf/gruber-darker.nvim",
		lazy = false,
		config = function()
		    -- vim.cmd.colorscheme("gruber-darker")
		end,
	},

    {
        "IlyasYOY/theme.nvim",
        lazy = false, 
        config = function()
            -- vim.cmd.colorscheme("ilyasyoy-mono")

            -- transparent bg
		    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
		    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

        end,
    },

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		config = function()
		 -- vim.cmd.colorscheme("gruvbox")
		end,
	},

	{ 
		"rebelot/kanagawa.nvim", 
		lazy = true,
		config = function()
		  -- vim.cmd.colorscheme("kanagawa")
		end,
	},


	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		config = function()
		  require("rose-pine").setup({
		  styles = {
		    transparency = true,
		  },
		})

		-- vim.cmd.colorscheme("rose-pine")
		end,
	},
}
