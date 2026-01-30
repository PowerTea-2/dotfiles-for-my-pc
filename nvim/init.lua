vim.g.mapleader = " "
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard (needs wl-clipboard)

vim.env.MYVIMRC = vim.fn.expand("~/.config/nvim/init.lua")

-- 2. LINE NUMBERS (Pure White for current, Grey for others)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#444444" })

-- 3. KEYBINDINGS
-- Ctrl + A to select all
vim.keymap.set('n', '<C-a>', 'ggVG')
vim.keymap.set('v', '<C-a>', '<Esc>ggVG')

-- Yanking (Linked to system clipboard via unnamedplus)
vim.keymap.set({'n', 'v'}, 'y', 'y')
-- 1. SYSTEM & CLIPBOARD
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- 2. KEYBINDINGS
vim.keymap.set('n', '<C-a>', 'ggVG')
vim.keymap.set('v', '<C-a>', '<Esc>ggVG')
vim.keymap.set({'n', 'v'}, 'y', 'y')

-- 3. THEME (Pure Black Background)
vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = "#000000" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#000000", bg = "#000000" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })

-- 4. EVA-01 SYNTAX (Green, Blue, Purple)
local logic_style = { fg = "#00FF00", bold = true, italic = true }
vim.api.nvim_set_hl(0, "Statement", logic_style)
vim.api.nvim_set_hl(0, "Keyword", logic_style)
vim.api.nvim_set_hl(0, "Conditional", logic_style)
vim.api.nvim_set_hl(0, "Repeat", logic_style)

-- 'local' in Electric Blue
vim.api.nvim_set_hl(0, "StorageClass", { fg = "#00D7FF", bold = true, italic = true })
vim.api.nvim_set_hl(0, "@keyword.luap", { fg = "#00D7FF", bold = true }) 

-- Methods and APIs in Neon Green
vim.api.nvim_set_hl(0, "Function", { fg = "#00FF00", bold = true })
vim.api.nvim_set_hl(0, "@method", { fg = "#00FF00" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#00FF00" })

-- Strings in Unit-01 Purple
vim.api.nvim_set_hl(0, "String", { fg = "#BF00FF" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#444444", italic = true })

-- 5. NERV UI (Orange & Purple)
-- Status bar: Purple armor
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#000000", bg = "#FFA500", bold = true })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#444444", bg = "#000000" })

-- Command line: Emergency Orange
vim.api.nvim_set_hl(0, "MsgArea", { fg = "#FFA500" })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#FFA500", bold = true })
vim.api.nvim_set_hl(0, "CmdLine", { fg = "#FFA500" })

-- Search: Warning Orange
vim.api.nvim_set_hl(0, "Search", { bg = "#FFA500", fg = "#000000", bold = true })

-- Selection: Inverted
vim.api.nvim_set_hl(0, "Visual", { bg = "#FFA500", fg = "#000000" })


-- This makes { } and ( ) stand out from the green logic
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#FFA500", bold = true })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#FFA500", bold = true })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#FFA500" })

-- GLOBAL SYNTAX LINKING
-- This ensures the theme works in .conf, .py, .cpp, etc.

-- 1. Links all "Constants" (like numbers and booleans) to Purple
vim.api.nvim_set_hl(0, "Constant", { link = "String" }) 

-- 2. Links "Identifiers" (like zram-size) to Green
vim.api.nvim_set_hl(0, "Identifier", { fg = "#00FF00" })

-- 3. Links "PreProc" (like the [zram0] header) to Green or Blue
vim.api.nvim_set_hl(0, "PreProc", { fg = "#00D7FF", bold = true })

-- 4. Links "Type" to Green
vim.api.nvim_set_hl(0, "Type", { fg = "#00FF00" })

vim.api.nvim_set_hl(0, "confKey", { fg = "#00FF00" })        -- Green Keys (zram-size)
vim.api.nvim_set_hl(0, "confValue", { fg = "#BF00FF" })      -- Purple Values (7937)
vim.api.nvim_set_hl(0, "confAssignment", { fg = "#FFA500" }) -- Orange = signs

-- 1. Ensure .conf files use the correct syntax engine
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.conf", "*.ini", "zram-generator.conf" },
  command = "set filetype=dosini"
})

-- 2. Force Eva-01 colors to RE-APPLY every time you enter a new file
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = "*",
    callback = function()
        -- Background & UI
        vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = "#000000" })
        vim.api.nvim_set_hl(0, "StatusLine", { fg = "#000000", bg = "#FFA500", bold = true })
        
        -- Syntax (Green & Purple)
        vim.api.nvim_set_hl(0, "Keyword", { fg = "#00FF00", bold = true, italic = true })
        vim.api.nvim_set_hl(0, "String", { fg = "#BF00FF" })
        vim.api.nvim_set_hl(0, "Number", { fg = "#BF00FF", bold = true })
        
        -- Brackets (Orange)
        vim.api.nvim_set_hl(0, "Delimiter", { fg = "#FFA500", bold = true })
        
        -- Specific fix for .conf files (dosini)
        vim.api.nvim_set_hl(0, "confKey", { fg = "#00FF00" })
        vim.api.nvim_set_hl(0, "confValue", { fg = "#BF00FF" })
    end,
})
