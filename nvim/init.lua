<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "utf-8"       -- Общая кодировка (необязательно, по умолчанию UTF-8)
vim.opt.fileencoding = "utf-8"  -- Кодировка файлов
vim.opt.number = true -- Show line numbers
<<<<<<< HEAD
vim.opt.relativenumber = true -- относительные номера строк
=======
<<<<<<< HEAD
=======
vim.opt.relativenumber = true -- относительные номера строк
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
vim.opt.cursorline = false -- Disable highlight current cursor's line
vim.opt.swapfile = false -- Disable .swp files 
vim.opt.scrolloff = 7 -- Number of lines left visible above/below the cursor when scrolling
vim.opt.tabstop = 4 -- Spaces instead of one tab
vim.opt.softtabstop = 4 -- Spaces instead of one tab
vim.opt.shiftwidth = 4 -- Spaces for auto indent
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.autoindent = true -- Save indent on new line
vim.opt.fileformat = "unix"
vim.opt.smartindent = true
vim.opt.splitbelow = true -- horizontal split open below and right
vim.opt.splitright = true
vim.g.mapleader = ',' -- Leader key
vim.opt.termguicolors = true -- 24-bit colors

-- Установите вертикальную черту на 80-й колонке
vim.opt.colorcolumn = "80"
-- vim.cmd([[highlight ColorColumn ctermbg=lightgrey guibg=lightgrey]]) -- цвет черты

-- Netrw file explorer settings
vim.g.netrw_banner = 0 -- hide banner above files
vim.g.netrw_liststyle = 3 -- tree instead of plain view
vim.g.netrw_browse_split = 3 -- open file in new tab



-- Keymaps for programming languages
vim.api.nvim_create_autocmd('FileType', {

    pattern = 'python',
    callback = function()

        vim.opt.colorcolumn = '88'
        vim.keymap.set('n', '<C-h>', ':w<CR>:!python3.11 %<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!python3.11 %<CR>', { buffer = true, silent = true })
    end
})


vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c',
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'sh', 'go'},
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!%<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!%<CR>', { buffer = true, silent = true })
    end
})

--


-- Common keymaps
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', ',<Space>', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', 'H', 'gT', { noremap = true }) -- Переключение вкладок
vim.keymap.set('n', 'L', 'gt', { noremap = true })
vim.keymap.set('n', ',f', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', ',g', ':Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', 'gw', ':bp|bd #<CR>', { noremap = true, silent = true })

-- Plugins with packer.nvim
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim' -- For Telescope plugin
    use 'neovim/nvim-lspconfig' -- LSP
    use 'hrsh7th/nvim-cmp' -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' -- Сниппеты
    use 'nvim-treesitter/nvim-treesitter' -- Подсветка синтаксиса
<<<<<<< HEAD
    
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
}

-- COLOR SCHEMES
=======
<<<<<<< HEAD

=======
    
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
}

-- COLOR SCHEMES
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
    use 'morhetz/gruvbox' -- Color schemes
    use 'ayu-theme/ayu-vim'
    --[[
    use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        require('rose-pine').setup({
          dark_variant = 'main', -- Variants: 'main', 'moon', 'dawn'
          disable_background = true, -- Disable background
          disable_float_background = false, -- Disable background for windows
        })
        vim.cmd('colorscheme rose-pine')
      end,
    })
    --]]
    use 'sainnhe/gruvbox-material'
    use 'rebelot/kanagawa.nvim'
<<<<<<< HEAD
    use 'vossenwout/guts.nvim'

=======
<<<<<<< HEAD
=======
    use 'vossenwout/guts.nvim'

>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)

    -- Comment/uncomment by gcc for current line of gc for seleted lines
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
            -- Включить/отключить добавление пробела после символа комментария
            padding = true,
            -- Переназначаем ключевые привязки
            toggler = {
                line = ',cc',  -- Закомментировать строку (вместо 'gcc')
                block = ',cb', -- Закомментировать блок (вместо 'gbc')
            },
            opleader = {
                line = ',c',   -- Закомментировать строки в визуальном режиме (вместо 'gc')
                block = ',b',  -- Закомментировать блоки в визуальном режиме (вместо 'gb')
            },
        })
      end
    }
<<<<<<< HEAD
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',  -- или cmake-строка ниже
          -- run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        },
      }
    }
=======
<<<<<<< HEAD
>>>>>>> 444d7a2 (add README.md and zsh)

    use 'Pocco81/auto-save.nvim' -- Автосохранение
    use 'nvimtools/none-ls.nvim' -- Продолжение null-ls, форматирование и линтинг
end)


-- Color scheme
-- vim.cmd([[colorscheme "rose-pine-main"]])
--vim.cmd([[colorscheme gruvbox-material]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus
vim.cmd.colorscheme("guts")

-- LSP

local capabilities = require('cmp_nvim_lsp').default_capabilities()
<<<<<<< HEAD

=======
=======
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',  -- или cmake-строка ниже
          -- run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        },
      }
    }

    use 'Pocco81/auto-save.nvim' -- Автосохранение
    use 'nvimtools/none-ls.nvim' -- Продолжение null-ls, форматирование и линтинг
end)


-- Color scheme
-- vim.cmd([[colorscheme "rose-pine-main"]])
--vim.cmd([[colorscheme gruvbox-material]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus
vim.cmd.colorscheme("guts")

-- LSP

local capabilities = require('cmp_nvim_lsp').default_capabilities()

>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
local on_attach = function(client, bufnr)

    -- Быстрые команды для LSP
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end

-- Настройка LSP для Python (Pyright)
<<<<<<< HEAD
vim.lsp.config('pyright', {
=======
<<<<<<< HEAD
lspconfig.pyright.setup({
>>>>>>> 444d7a2 (add README.md and zsh)
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
      },
    },
  },
})



-- Пример настройки LSP для TypeScript
<<<<<<< HEAD

vim.lsp.config('ts_ls', {
=======
lspconfig.ts_ls.setup({
=======
vim.lsp.config('pyright', {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
      },
    },
  },
})



-- Пример настройки LSP для TypeScript

vim.lsp.config('ts_ls', {
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
    capabilities = capabilities,
    on_attach = on_attach,
})

<<<<<<< HEAD


=======
<<<<<<< HEAD
>>>>>>> 444d7a2 (add README.md and zsh)
-- Пример настройки LSP для Go

vim.lsp.config('gopls', {
    cmd = { "gopls" },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      gopls = {
        analyses = { unusedparams = true },
        staticcheck = true,
    },
  },
})

-- None-ls (бывший null-ls) для Prettier
local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
})

<<<<<<< HEAD
=======
=======


-- Пример настройки LSP для Go

vim.lsp.config('gopls', {
    cmd = { "gopls" },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      gopls = {
        analyses = { unusedparams = true },
        staticcheck = true,
    },
  },
})

-- None-ls (бывший null-ls) для Prettier
local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
})

>>>>>>> 444d7a2 (add README.md and zsh)
vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('rust_analyzer')


<<<<<<< HEAD
=======
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
-- Telescope
require('telescope').setup()
-- require('telescope').load_extension('fzf')

-- Auto-save
require('auto-save').setup()

-- Copy selected text to Windows buffer with "*y
-- vim.g.clipboard = {
--   name = 'win32yank',
--   copy = {
--     ['+'] = 'win32yank.exe -i',
--     ['*'] = 'win32yank.exe -i',
--   },
--   paste = {
--     ['+'] = 'powershell -noprofile -command "Get-Clipboard"',
--     ['*'] = 'powershell -noprofile -command "Get-Clipboard"',
--   },
--   cache_enabled = 0,
-- }

-- Autocomplete settings
local cmp = require('cmp')
local luasnip = require('luasnip')
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======

>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
<<<<<<< HEAD
    autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged }, -- Включить автоматическое появление
=======
<<<<<<< HEAD
    autocomplete = false, -- Отключить автоматическое появление
=======
    autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged }, -- Включить автоматическое появление
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(), -- Вызов меню автокомплита
    ['<C-e>'] = cmp.mapping.abort(), -- Закрыть меню
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Навигация вверх
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Навигация вниз
  },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },  -- Источник из LSP
        { name = 'luasnip' },  -- Источник для сниппетов
    }),
})

-- transparent bg — remove if you want
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])



-- Автоматическое закрытие скобок и кавычек
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Настройка для автоматического закрытия
local pair_map = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ["'"] = "'",
    ['"'] = '"',
    ["`"] = "`",
}

for open, close in pairs(pair_map) do
    map("i", open, open .. close .. "<Left>", {})
end

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 444d7a2 (add README.md and zsh)

-- Visual: cc -> yank to system clipboard (y"+)
vim.keymap.set('v','cc','"+y', { noremap = true, silent = true })


-- Start screen
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')


local function footer()
  local v = vim.version()
  return "NVIM v" .. v.major .. "." .. v.minor .. "." .. v.patch .. ""
end

vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#6f2e2a' })
vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#83799C', italic = true })
vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#997e95' })
vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = '#521B15', bold = true })

dashboard.section.header.val = vim.split(
	[[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢠⣿⣿⣿⣿⣧⠀⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡏⠀⠀⣾⣿⣿⣿⣿⣿⡇⠀⢻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠃⠀⢰⣿⠋⠀⠀⠈⢻⣿⠀⠘⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠘⣿⠀⠀⠀⠀⢀⡟⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣤⣄⣀⡀⠀⠀⠀⠀⠀⠙⢆⠀⠀⠀⠈⠀⠀⠀⠀⢀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣶⡄⠀⠹⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⡀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠘⣿⣿⣿⣿⣷⡌⢲⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣄⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡀⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣆⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡿⠿⣿⣧⣤⣄⣈⡑⠄⠀⠀⠀⠀⠀⢠⣿⣿⡿⢰⡄⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀
⠀⢀⣴⣿⡿⠋⠀⠀⠀⠈⠛⢿⣿⣿⣿⣾⣯⣄⠀⠀⠀⠀⠀⠉⠻⣿⣿⣶⣄⠀⠀⠀⣴⣿⣿⡿⢡⣾⣿⡄⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀
⢴⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣷⡘⢶⣶⣆⠀⠀⠀⠹⣿⣿⣧⡀⠀⠈⢻⣿⣷⣮⠹⡟⠁⠀⠀⠀⠀⠀⠀⠙⣿⣿⡦
⠀⠙⢿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣷⠘⠛⠛⢂⡀⠀⠀⠙⠛⠛⢧⠀⠀⠀⢿⣿⣿⡗⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠀
⠀⠀⠀⠙⢿⣅⠀⠀⢀⣀⣀⣀⣀⣿⡛⠛⠛⠛⠛⠻⠷⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⢀⡀⢸⣿⡟⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠙⢷⣦⡀⠙⢿⣿⣿⣿⣿⣷⣦⠠⣄⣀⠀⠀⠙⠿⠿⠿⢷⡀⠀⠀⠀⣠⣾⣿⡜⣿⠃⠀⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⢿⣷⣄⠙⢿⣿⣿⣿⣿⣇⢻⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣷⣿⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠙⡿⠛⠛⠛⠲⢶⣶⣦⡄⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⠀⢠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣤⣀⠀⠈⠙⠻⠀⢀⣀⣀⣤⣤⣶⣿⣿⣿⣿⠟⠉⠀⡸⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣧⡀⢲⣶⣦⣼⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢶⣤⣌⡙⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣾⣿⣿⣿⣿⣿⣿⡿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⠟⢋⣥⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠋⣠⣾⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]], '\n', { trimempty = true })


dashboard.section.header.opts.hl = 'AlphaHeader'

dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('f', '󰱼  Find file', ':Telescope find_files <CR>'),
    dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
    dashboard.button('c', '  Config', ':e ~/.config/nvim/init.lua <CR>'),
    dashboard.button('q', '  Quit', ':qa <CR>'),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = 'AlphaButtons'
  button.opts.hl_shortcut = 'AlphaShortcut'
end


dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = 'AlphaFooter'

alpha.setup(dashboard.opts)


vim.api.nvim_create_autocmd('FileType', {
  pattern = 'alpha',
  callback = function()
    vim.opt_local.foldenable = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.signcolumn = 'no'
  end,
})


<<<<<<< HEAD
=======
>>>>>>> d2862f4 (new files from mac)
>>>>>>> 444d7a2 (add README.md and zsh)
