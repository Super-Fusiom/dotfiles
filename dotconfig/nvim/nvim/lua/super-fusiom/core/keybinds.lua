vim.g.mapleader = " " -- set leader key before lazy

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment Number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement Number" })

-- Win management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontal" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
